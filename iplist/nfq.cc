/*
	iplist - List based packet handler
	Copyright (C) 2010 Serkan Sakar <uljanow@users.sourceforge.net>

	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  
	02110-1301, USA
*/

#include <stdexcept>
#include <cassert>
#include <string.h>
#include <cstdlib>

#include <syslog.h>
#include <sys/time.h>

#include "nfq.h"
#include "log.h"
#include "iplist.h"

#define SRC_ADDR(data)	(*(in_addr_t*)((data)+12))
#define DST_ADDR(data)	(*(in_addr_t*)((data)+16))

#define GET_SHORT(p)	(((u_char*)p)[0] << 8 | ((u_char*)p)[1])

#define SRC_PORT(data, ip_hlen) GET_SHORT((data) + (ip_hlen))
#define DST_PORT(data, ip_hlen) GET_SHORT((data) + (ip_hlen) + 2)

nfq::nfq_hook::nfq_hook():
 	BUF_SIZE(4096), h(NULL), qh(NULL), nh(NULL), buf(new char[BUF_SIZE]),
	queue_num(NFQ_NUM)
{}

nfq::nfq_hook::~nfq_hook()
{
	// unbinding from queue
	if (qh) {
		nfq_destroy_queue(qh);
		syslog(LOG_NOTICE, "info: unbinding from queue %hu\n", queue_num);
	}
	// closing library handle
	if (h) nfq_close(h);
}

void nfq::nfq_hook::init(range::range_set_t* rset)
{
	queue_num = rset->nfq_num;
	// opening library handle
	if (!(h = nfq_open()))
		throw std::runtime_error("can't open library handle");
	// unbinding existing nf_queue handler for AF_INET (if any)
	nfq_unbind_pf(h, AF_INET);
	// binding nfnetlink_queue as nf_queue handler for AF_INET
	if (nfq_bind_pf(h, AF_INET) < 0)
		throw std::runtime_error("can't bind nf_queue handler");
	// binding this socket to queue, passing down rset to cb
	if (!(qh = nfq_create_queue(h, queue_num, nfq::nfq_hook::cb, rset)))
		throw std::runtime_error("can't bind socket to queue");
	else
		syslog(LOG_NOTICE, "info: binding socket to queue %hu\n", queue_num);
	// setting copy_packet mode
#ifdef LESS_MEMORY
	if (nfq_set_mode(qh, NFQNL_COPY_PACKET, 21) < 0)
#else
	if (nfq_set_mode(qh, NFQNL_COPY_PACKET, 0xffff) < 0)
#endif
		throw std::runtime_error("can't set packet_copy mode");

	nh = nfq_nfnlh(h);
	fd = nfnl_fd(nh);
}

void nfq::nfq_hook::listen()
{
	while ((rv = recv(fd, buf.get(), BUF_SIZE, 0)) >= 0) 
		nfq_handle_packet(h, buf.get(), rv);
}

int nfq::nfq_hook::cb(nfq_q_handle* qh, nfgenmsg*, nfq_data* nfa, void* p)
{
	int err;
	uint32_t id;
	unsigned char* data;
	nfqnl_msg_packet_hdr* ph;
	range::range_set_t::iterator i;

	if (!(ph = nfq_get_msg_packet_hdr(nfa))) 
		throw std::runtime_error("can't get packet header");

	id = ntohl(ph->packet_id);

	if (nfq_get_payload(nfa, &data) < 0)
		throw std::runtime_error("can't get payload");

	const range::range_set_t* rset = (range::range_set_t*)p;

	switch (ph->hook) {
	case NF_IP_PRE_ROUTING:
	case NF_IP_LOCAL_IN:
		i = rset->find(ntohl(SRC_ADDR(data))); break;
	case NF_IP_LOCAL_OUT:
	case NF_IP_POST_ROUTING:
		i = rset->find(ntohl(DST_ADDR(data))); break;
	case NF_IP_FORWARD:
		if ((i = rset->find(ntohl(SRC_ADDR(data)))) == rset->end())
			i = rset->find(ntohl(DST_ADDR(data)));
		break;
	default:
		throw std::runtime_error("netfilter chain not supported");
	}
	if (i != rset->end()) {
		err = (rset->target_mark) ? 
			nfq_set_verdict_mark(qh, id, i->target, htonl(rset->target_mark), 0, NULL) : 
			nfq_set_verdict(qh, id, i->target, 0, NULL);

		if (log::loglevel & (LOG_MATCH | LOG_ALL))
			print_pkt(" Match=" + i->name, i->target, nfa, ph);
	} else {
		err = (rset->policy_mark) ? 
			nfq_set_verdict_mark(qh, id, rset->policy, htonl(rset->policy_mark), 0, NULL) : 
			nfq_set_verdict(qh, id, rset->policy, 0, NULL);

		if (log::loglevel & LOG_ALL)
			print_pkt("", rset->policy, nfa, ph);
	}
	if (err < 0) 
		throw std::runtime_error("can't handle packet");
	return err;
}

void nfq::nfq_hook::print_pkt(std::string msg, int8_t target,
		nfq_data* nfa, nfqnl_msg_packet_hdr* ph)
{
	packet_msg pkt;
	unsigned char* data;

	if (nfq_get_timestamp(nfa, &pkt.tv)) 
		gettimeofday(&pkt.tv, NULL);

	if ((pkt.len = nfq_get_payload(nfa, &data)) < 0)
		throw std::runtime_error("can't get payload");

	int ip_hlen = 4 * (data[0] & 0x0f);

	memset(pkt.name, '\0', NAME_SIZE);
	strncpy(pkt.name, msg.c_str(), NAME_SIZE-1);

	pkt.mtype = iplist::PACKET;
	pkt.hook = ph->hook;
	pkt.target = target;
	pkt.proto = data[9];
	pkt.src_ip.s_addr = SRC_ADDR(data); 
	pkt.dst_ip.s_addr = DST_ADDR(data);

	if (pkt.proto == IPPROTO_TCP || pkt.proto == IPPROTO_UDP) {
		pkt.src_port = SRC_PORT(data, ip_hlen);
		pkt.dst_port = DST_PORT(data, ip_hlen);
	}
	if (log::loglevel & LOG_VERBOSE) { 
		pkt.hw_proto = ntohs(ph->hw_protocol);
		pkt.id = ntohl(ph->packet_id);
		pkt.mark = nfq_get_nfmark(nfa);
		pkt.indev = nfq_get_indev(nfa);
		pkt.physindev = nfq_get_physindev(nfa);
		pkt.outdev = nfq_get_outdev(nfa);
		pkt.physoutdev = nfq_get_physoutdev(nfa);
	}
	if (msgsnd(iplist::ps.msqid, &pkt, MSGSIZE(packet_msg), 0) == -1)
		throw std::runtime_error("can't send packet message");
}

void* nfq::nfq_start(void* p)
{
	int err = EXIT_SUCCESS;
	try {
		int old_cancel_state;
		pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, &old_cancel_state);

		range::range_set_ptr rset(*(range::range_set_ptr*)p);
		nfq_hook nfh;		
		nfh.init(rset.get());

		pthread_setcancelstate(old_cancel_state, NULL);
		nfh.listen();
	
	} catch (const std::exception& e) {
		syslog(LOG_ERR, "thread[%lu]: error: %s\n", pthread_self(), e.what());
		err = EXIT_FAILURE;
	}
	return (void*)err;
}

