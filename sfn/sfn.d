/*
 * sfn.d
 *
 * Copyright 2012 m1kc <m1kc@yandex.ru>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 *
 */

import std.stdio;
import std.file;
import std.socket;
import std.socketstream;
import std.getopt;
import std.conv;
import std.string;
import std.path;
import std.datetime;
import core.thread;
import std.compiler;

__gshared bool localDone = false;
__gshared bool remoteDone = false;
__gshared SocketStream stream = null;
__gshared Socket listener = null;
__gshared Socket socket = null;
__gshared string[] send;
__gshared string prefix = "";

immutable uint windowSize = 1024*64;

void main(string[] args)
{
	bool server = false;
	string connect = null;
	ushort port = 3214;
	bool help = false;
	bool ver = false;
	bool noExtIP = false;

	getopt(args,
		"version|v", &ver,
		"help|h", &help,
		"listen|l|s", &server,
		"connect|c", &connect,
		"port|p", &port,
		"prefix|f", &prefix,
		"no-external-ip|n", &noExtIP,
	);
	send = args[1..$];

	if (help) { usage(true); return; }
	if (ver) { writeln("sfn 1.1" ~ "\nCompiled by: " ~ std.compiler.name); return; }

	if ((connect is null) && !server) { usage(false, "You must specify mode."); return; }
	if ((connect !is null) && server) { usage(false, "You must specify only one mode."); return; }

	if (server)
	{
		listener = new TcpSocket();
		assert(listener.isAlive);
		listener.bind(new InternetAddress(port));
		listener.listen(10);
		writeln("Waiting for connection...");
		if (!noExtIP)
		{
			Thread ext = new Thread( &extIP );
			ext.start();
		}
		socket = listener.accept();
		writeln("Connected: " ~ to!string(socket.remoteAddress()));
		stream = new SocketStream(socket);
	}
	else
	{
		writeln("Connecting...");
		socket = new TcpSocket(new InternetAddress(connect, port));
		writeln("Connected.");
		stream = new SocketStream(socket);
	}
	scope(exit)
	{
		stream.close();
		socket.close();
		if (listener !is null) listener.close();
	}
	Thread receiver = new Thread( &receiveFiles );
	receiver.start();
	Thread sender = new Thread( &sendFiles );
	sender.start();
	writeln("Started transfer.");
	// wait
	while(!localDone || !remoteDone) Thread.sleep( dur!("msecs")(100) );
	writeln("Transfer complete.");
	return;
}

void showBar(ulong progress, ulong total, long startTime = -1)
{
	uint terminalWidth = 80;
	uint barsCount = 80-1-2-20-1-20;
	ulong bars = progress*(barsCount+1)/total;
	write("[");
	for (int i=0; i<barsCount; i++) write(i<bars ? "#" : "-");
	write("] ");
	write(progress, "/", total, "\r");
}

void receiveFiles()
{
	immutable ubyte FILE = 0x01;
	immutable ubyte DONE = 0x02;

	ubyte b;
	
	while(true)
	{
		stream.read(b);
		if (b == DONE)
		{
			writeln("Remote done.");
			remoteDone = true;
			return;
		}
		else if (b == FILE)
		{
			write("Receiving a file: ");
			string filename = to!string(stream.readLine());
			write(filename ~ ", ");
			ulong size;
			stream.read(size);
			writeln(size, " bytes");

			File f = File(prefix ~ filename, "w");
			
			ubyte[] buf = new ubyte[windowSize];
			ulong remain = size;
			ulong readc;
			while(remain > 0)
			{
				if (remain < windowSize) buf = new ubyte[cast(uint)(remain)];
				readc = stream.read(buf);
				remain -= readc;
				f.rawWrite(buf[0..cast(uint)(readc)]);
				showBar(size-remain, size);
			}
			writeln();
			writeln("Done.");
			f.close();
		}
		else
		{
			writeln("Unexpected byte " ~ to!string(b));
		}
	}
}

void sendFiles()
{
	immutable ubyte FILE = 0x01;
	immutable ubyte DONE = 0x02;

	foreach(string s; send)
	{
		writeln("Sending a file: " ~ s);
		DirEntry d = dirEntry(s);
		if (d.isFile())
		{
			stream.write(FILE);
			File f = File(s, "r");
			stream.writeString(f.name.split(dirSeparator)[$-1]);
			stream.writeString("\n");
			stream.write(f.size());
			writeln(to!string(f.size()) ~ " bytes");
			ulong size = f.size();
			ulong sent = 0;
			long start = Clock.currStdTime();
			foreach (ubyte[] b; f.byChunk(windowSize))
			{
				stream.write(b);
				sent += b.length;
				showBar(sent, size, start);
			}
			writeln();
			writeln("Done.");
			f.close();
		}
		else
		{
			writeln("Error: does not exist or is not a file");
		}
	}

	stream.write(DONE);
	localDone = true;
	writeln("Local done.");
}

void extIP()
{
	// URL: http://tomclaw.com/services/simple/getip.php
	
	Socket sock = new TcpSocket(new InternetAddress("tomclaw.com", 80));
	scope(exit) sock.close();
	SocketStream ss = new SocketStream(sock);

	ss.writeString(
		"GET /services/simple/getip.php HTTP/1.0\r\n"
		"Host: tomclaw.com\r\n"
		"\r\n"
	);

	// headers
	while(true)
	{
		auto line = ss.readLine();
		if (line.length==0) break;
	}

	// IP
	auto ip = ss.readLine();
	writeln("External IP: ", ip);
	// reverse DNS lookup
	InternetHost ih = new InternetHost();
	if (ih.getHostByAddr(ip))
	{
		writeln("Host: ", ih.name);
		foreach (string s; ih.aliases) writeln("Alias: ", s); 
	}
	else
	{
		writeln("Host: ", "can't determine");
	}
}

void usage(bool desc = false, string error = null)
{
	if (error !is null) writeln(error);
	if (desc) write("sfn - send files over network. ");
	write("Usage:

    sfn --listen [options] [files to send]
    sfn --connect <address> [options] [files to send]

sfn will establish a connection, send all the files, receive all the files from another side and then exit.

-l and -s are aliases for --listen, -c is an alias for --connect.

Options:

    --version, -v         Show sfn version and exit.
    --help, -h            Show this text and exit.
    --port, -p            Use specified port. Defaults to 3214.
    --prefix, -f          Add prefix to received files' path and name. For example: '/home/user/downloads/', 'sfn-', '/etc/file-'.
    --no-external-ip, -n  Don't perform external IP detection and reverse DNS lookup.

");

}
