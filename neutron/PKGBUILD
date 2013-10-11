# Maintainer: Lance Chen <cyen0312+aur@gmail.com>

pkgbase=neutron
pkgname=neutron
true && pkgname=('python2-neutron'
                 'neutron-common'
                 'neutron-dhcp-agent'
                 'neutron-l3-agent'
                 'neutron-lbaas-agent'
                 'neutron-metadata-agent'
                 'neutron-plugin-bigswitch'
                 'neutron-plugin-brocade'
                 'neutron-plugin-cisco'
                 'neutron-plugin-hyperv'
                 'neutron-plugin-linuxbridge'
                 'neutron-plugin-linuxbridge-agent'
                 'neutron-plugin-metaplugin'
                 'neutron-plugin-metering-agent'
                 'neutron-plugin-midonet'
                 'neutron-plugin-mlnx-agent'
                 'neutron-plugin-nec'
                 'neutron-plugin-nec-agent'
                 'neutron-plugin-nicira'
                 'neutron-plugin-openvswitch'
                 'neutron-plugin-openvswitch-agent'
                 'neutron-plugin-plumgrid'
                 'neutron-plugin-ryu'
                 'neutron-plugin-ryu-agent'
                 'neutron-plugin-vpn-agent'
                 'neutron-server')

pkgver=2013.2.rc1
pkgrel=1
pkgdesc="A virtual network service for Openstack"
arch=(any)
url="https://launchpad.net/neutron"
license=('Apache')
depends=('python2' 'python2-setuptools')
makedepends=('python2-setuptools')
install=neutron.install
source=("$url/havana/havana-rc1/+download/$pkgbase-$pkgver.tar.gz"
        "neutron-dhcp-agent.service"
        "neutron-l3-agent.service"
        "neutron-lbaas-agent.service"
        "neutron-metadata-agent.service"
        "neutron-plugin-linuxbridge-agent.service"
        "neutron-plugin-metering-agent.service"
        "neutron-plugin-mlnx-agent.service"
        "neutron-plugin-nec-agent.service"
        "neutron-plugin-openvswitch-agent.service"
        "neutron-plugin-ryu-agent.service"
        "neutron-plugin-vpn-agent.service"
        "neutron-server-default"
        "neutron-server.service"
        "neutron_sudoers")
md5sums=('c58ec5c0a693d9eca2cb05b1f4791d58'
         'c59c436057efbb2317487a0822aa97e7'
         'ca5d870e84ca2cce40bab18bf770870f'
         'f080ddbe9b270c1ffd241db9723bc565'
         '1ab745acf0da636c4484803969229714'
         '31ed220677df34466ca25fb1d64e9df0'
         'ef5a00d81ecea910fb29706e3181fc80'
         '926c8fe2ec3fd79955ed8f74109fceea'
         '50bc95405d91d73a583c508a0446e38c'
         'f40d35da4256957eb0dd6e0ce6a4c696'
         '50946c6024c5043c7046968e6eb9b698'
         '9f2af5aef38b58a6b11f715059aecb95'
         '91d4643e9c29210cc82ec8c8c512675d'
         '00bb831c8e9d31532e151384070b07e8'
         '2cfc83f85ae2f8bc790e280da721262d')

build() {
  cd "$pkgbase-$pkgver"
  /usr/bin/python2 setup.py build
  /usr/bin/python2 setup.py install --root="$srcdir/tmp" \
                                    --install-data="/" \
                                    --optimize=1
}

package_python2-neutron() {
  pkgdesc+=" - Python library"
  depends=('python2-alembic>=0.4.1'
           'python2-amqplib>=0.6.1'
           'python2-anyjson>=0.3.3'
           'python2-babel>=0.9.6'
           'python2-eventlet>=0.13.0'
           'python2-greenlet>=0.3.2'
           'python2-httplib2'
           'python2-iso8601>=0.1.4'
           'python2-jinja'
           'python2-jsonrpclib'
           'python2-keystoneclient>=0.3.2'
           'python2-kombu>=2.4.8'
           'python2-netaddr'
           'python2-novaclient>=2.15.0'
           'python2-oslo-config>=1.2.0'
           'python2-paste'
           'python2-paste-deploy>=1.5.0'
           'python2-pbr>=0.5.21'
           'python2-pbr<1.0'
           'python2-neutronclient>=2.3.0'
           'python2-neutronclient<3.0.0'
           'python2-requests>=1.1'
           'python2-routes>=1.12.3'
           'python2-six'
           'python2-sqlalchemy-0.7.9'
           'python2-stevedore>=0.10'
           'python2-webob>=1.2.3'
           'python2-webob<1.3')
  conflics=('python2-quantum')
  cd tmp

  install -d ${pkgdir}/usr/lib/
  cp -R usr/lib/ ${pkgdir}/usr/
}

package_neutron-common() {
  pkgdesc+=" - common"
  depends=('python2-neutron')
  conflics=('quantum-common')
  backup=('etc/neutron/api-paste.ini'
          'etc/neutron/neutron.conf')

  cd tmp

  install -d ${pkgdir}/etc/neutron/rootwrap.d/
  install -m 640 etc/neutron/api-paste.ini ${pkgdir}/etc/neutron/
  install -m 640 etc/neutron/policy.json ${pkgdir}/etc/neutron/
  install -m 640 etc/neutron/neutron.conf ${pkgdir}/etc/neutron/
  install -m 644 etc/neutron/rootwrap.conf ${pkgdir}/etc/neutron/
  install -m 644 etc/neutron/rootwrap.d/iptables-firewall.filters ${pkgdir}/etc/neutron/rootwrap.d/
  
  install -d ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-db-manage ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-debug ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-netns-cleanup ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-ovs-cleanup ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-rootwrap ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-rootwrap-xen-dom0 ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-usage-audit ${pkgdir}/usr/bin/

  install -d -m 0750 ${pkgdir}/etc/sudoers.d/
  install -m 440 ${srcdir}/neutron_sudoers ${pkgdir}/etc/sudoers.d/

  install -d -m 0770 ${pkgdir}/var/lib/neutron/
  install -d -m 0770 ${pkgdir}/var/log/neutron/
}

package_neutron-dhcp-agent() {
  pkgdesc+=" - DHCP agent"
  depends=('neutron-common' 'dnsmasq' 'neutron-metadata-agent')
  conflics=('quantum-dhcp-agent')
  backup=('etc/neutron/dhcp_agent.ini')

  cd tmp

  install -d ${pkgdir}/etc/neutron/rootwrap.d/
  install -m 640 etc/neutron/dhcp_agent.ini ${pkgdir}/etc/neutron/
  install -m 644 etc/neutron/rootwrap.d/dhcp.filters ${pkgdir}/etc/neutron/rootwrap.d/

  install -d ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-dhcp-agent ${pkgdir}/usr/bin/

  install -D -m 644 ${srcdir}/neutron-dhcp-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-dhcp-agent.service
}

package_neutron-l3-agent() {
  pkgdesc+=" - l3 agent"
  depends=('neutron-common' 'neutron-metadata-agent')
  conflics=('quantum-l3-agent')
  backup=('etc/neutron/l3_agent.ini')

  cd tmp

  install -d ${pkgdir}/etc/neutron/rootwrap.d/
  install -m 640 etc/neutron/l3_agent.ini ${pkgdir}/etc/neutron/
  install -m 644 etc/neutron/rootwrap.d/l3.filters ${pkgdir}/etc/neutron/rootwrap.d/

  install -D -m 755 usr/bin/neutron-l3-agent ${pkgdir}/usr/bin/neutron-l3-agent

  install -D -m 644 ${srcdir}/neutron-l3-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-l3-agent.service
}

package_neutron-lbaas-agent() {
  pkgdesc+=" - LBaaS agent"
  depends=('neutron-common' 'neutron-metadata-agent' 'haproxy')
  conflics=('quantum-lbaas-agent')
  backup=('etc/neutron/lbaas_agent.ini')

  cd tmp

  install -d ${pkgdir}/etc/neutron/rootwrap.d/
  install -m 640 etc/neutron/lbaas_agent.ini ${pkgdir}/etc/neutron/
  install -m 644 etc/neutron/rootwrap.d/lbaas-haproxy.filters ${pkgdir}/etc/neutron/rootwrap.d/

  install -D -m 755 usr/bin/neutron-lbaas-agent ${pkgdir}/usr/bin/neutron-lbaas-agent

  install -D -m 644 ${srcdir}/neutron-lbaas-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-lbaas-agent.service
}

package_neutron-metadata-agent() {
  pkgdesc+=" - metadata agent"
  depends=('neutron-common')
  conflics=('quantum-metadata-agent')
  backup=('etc/neutron/metadata_agent.ini')

  cd tmp

  install -D -m 640 etc/neutron/metadata_agent.ini ${pkgdir}/etc/neutron/metadata_agent.ini

  install -d ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-metadata-agent ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-ns-metadata-proxy ${pkgdir}/usr/bin/

  install -D -m 644 ${srcdir}/neutron-metadata-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-metadata-agent.service
}

package_neutron-plugin-bigswitch() {
  pkgdesc+=" - BigSwitch agent"
  depends=('neutron-common')
  conflics=('quantum-plugin-bigswitch')
  backup=('etc/neutron/plugins/bigswitch/restproxy.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/bigswitch/restproxy.ini \
                    ${pkgdir}/etc/neutron/plugins/bigswitch/restproxy.ini
}

package_neutron-plugin-brocade() {
  pkgdesc+=" - Brocade agent"
  depends=('neutron-common')
  conflics=('quantum-plugin-brocade')
  backup=('etc/neutron/plugins/brocade/brocade.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/brocade/brocade.ini \
                    ${pkgdir}/etc/neutron/plugins/brocade/brocade.ini
}

package_neutron-plugin-cisco() {
  pkgdesc+=" - Cisco agent"
  depends=('neutron-common')
  conflics=('quantum-plugin-cisco')
  backup=('etc/neutron/plugins/cisco/cisco_plugins.ini')

  cd tmp

  install -d ${pkgdir}/etc/neutron/plugins/cisco/
  install -m 640 etc/neutron/plugins/cisco/cisco_plugins.ini ${pkgdir}/etc/neutron/plugins/cisco/
}

package_neutron-plugin-hyperv() {
  pkgdesc+=" - Hyper-V plugin"
  depends=('neutron-common')
  conflics=('quantum-plugin-hyperv')
  backup=('etc/neutron/plugins/hyperv/hyperv_neutron_plugin.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/hyperv/hyperv_neutron_plugin.ini \
                    ${pkgdir}/etc/neutron/plugins/hyperv/hyperv_neutron_plugin.ini
}

package_neutron-plugin-linuxbridge() {
  pkgdesc+=" - linuxbridge plugin"
  depends=('neutron-common')
  conflics=('quantum-plugin-linuxbridge')
  backup=('etc/neutron/plugins/linuxbridge/linuxbridge_conf.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/linuxbridge/linuxbridge_conf.ini \
                    ${pkgdir}/etc/neutron/plugins/linuxbridge/linuxbridge_conf.ini
}

package_neutron-plugin-linuxbridge-agent() {
  pkgdesc+=" - linuxbridge plugin agent"
  depends=('neutron-common' 'bridge-utils' 'neutron-plugin-linuxbridge')
  conflics=('quantum-plugin-linuxbridge-agent')

  cd tmp

  install -D -m 644 etc/neutron/rootwrap.d/linuxbridge-plugin.filters \
                    ${pkgdir}/etc/neutron/rootwrap.d/linuxbridge-plugin.filters
  install -D -m 755 usr/bin/neutron-linuxbridge-agent ${pkgdir}/usr/bin/neutron-linuxbridge-agent
  install -D -m 644 ${srcdir}/neutron-plugin-linuxbridge-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-plugin-linuxbridge-agent.service
}

package_neutron-plugin-metaplugin() {
  pkgdesc+=" - Metaplugin plugin"
  depends=('neutron-common')
  conflics=('quantum-plugin-metaplugin')
  backup=('etc/neutron/plugins/metaplugin/metaplugin.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/metaplugin/metaplugin.ini \
                    ${pkgdir}/etc/neutron/plugins/metaplugin/metaplugin.ini
}

package_neutron-plugin-metering-agent() {
  pkgdesc+=" - metering plugin agent"
  depends=('neutron-common')
  backup=('etc/neutron/metering_agent.ini')

  cd tmp

  install -D -m 640 etc/neutron/metering_agent.ini ${pkgdir}/etc/neutron/metering_agent.ini
  install -D -m 755 usr/bin/neutron-metering-agent ${pkgdir}/usr/bin/neutron-metering-agent
  install -D -m 644 ${srcdir}/neutron-plugin-metering-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-plugin-metering-agent.service
}

package_neutron-plugin-midonet() {
  pkgdesc+=" - Midonet plugin"
  depends=('neutron-common')
  conflics=('quantum-plugin-midonet')
  backup=('etc/neutron/plugins/midonet/midonet.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/midonet/midonet.ini \
                    ${pkgdir}/etc/neutron/plugins/midonet/midonet.ini
}

package_neutron-plugin-mlnx-agent() {
  pkgdesc+=" - MLNX plugin agent"
  depends=('neutron-common')
  backup=('etc/neutron/plugins/mlnx/mlnx_conf.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/mlnx/mlnx_conf.ini \
                    ${pkgdir}/etc/neutron/plugins/mlnx/mlnx_conf.ini
  install -D -m 755 usr/bin/neutron-mlnx-agent ${pkgdir}/usr/bin/neutron-mlnx-agent
  install -D -m 644 ${srcdir}/neutron-plugin-mlnx-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-plugin-mlnx-agent.service
}

package_neutron-plugin-nec() {
  pkgdesc+=" - NEC plugin"
  depends=('neutron-common')
  conflics=('quantum-plugin-nec')
  backup=('etc/neutron/plugins/nec/nec.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/nec/nec.ini ${pkgdir}/etc/neutron/plugins/nec/nec.ini
}

package_neutron-plugin-nec-agent() {
  pkgdesc+=" - NEC plugin agent"
  depends=('neutron-common' 'openvswitch' 'neutron-plugin-nec')
  conflics=('quantum-plugin-nec-agent')

  cd tmp

  install -D -m 644 etc/neutron/rootwrap.d/nec-plugin.filters \
                    ${pkgdir}/etc/neutron/rootwrap.d/nec-plugin.filters
  install -D -m 755 usr/bin/neutron-nec-agent ${pkgdir}/usr/bin/neutron-nec-agent
  install -D -m 644 ${srcdir}/neutron-plugin-nec-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-plugin-nec-agent.service
}

package_neutron-plugin-nicira() {
  pkgdesc+=" - Nicira plugin"
  depends=('neutron-common')
  conflics=('quantum-plugin-nicira')
  backup=('etc/neutron/plugins/nicira/nvp.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/nicira/nvp.ini ${pkgdir}/etc/neutron/plugins/nicira/nvp.ini
  install -D -m 755 usr/bin/neutron-check-nvp-config ${pkgdir}/usr/bin/neutron-check-nvp-config
}

package_neutron-plugin-openvswitch() {
  pkgdesc+=" - Open vSwitch plugin"
  depends=('neutron-common')
  conflics=('quantum-plugin-openvswitch')
  backup=('etc/neutron/plugins/openvswitch/ovs_neutron_plugin.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/openvswitch/ovs_neutron_plugin.ini \
                    ${pkgdir}/etc/neutron/plugins/openvswitch/ovs_neutron_plugin.ini
}

package_neutron-plugin-openvswitch-agent() {
  pkgdesc+=" - Open vSwitch plugin agent"
  depends=('openvswitch'
           'neutron-common'
           'neutron-plugin-openvswitch')
  conflics=('quantum-plugin-openvswitch-agent')
  cd tmp

  install -D -m 644 etc/neutron/rootwrap.d/openvswitch-plugin.filters \
                    ${pkgdir}/etc/neutron/rootwrap.d/openvswitch-plugin.filters
  install -D -m 755 usr/bin/neutron-openvswitch-agent ${pkgdir}/usr/bin/neutron-openvswitch-agent
  install -D -m 644 ${srcdir}/neutron-plugin-openvswitch-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-plugin-openvswitch-agent.service
}

package_neutron-plugin-plumgrid() {
  pkgdesc+=" - PLUMgrid plugin"
  depends=('neutron-common')
  conflics=('quantum-plugin-plumgrid')
  backup=('etc/neutron/plugins/plumgrid/plumgrid.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/plumgrid/plumgrid.ini \
                    ${pkgdir}/etc/neutron/plugins/plumgrid/plumgrid.ini
}

package_neutron-plugin-ryu() {
  pkgdesc+=" - RYU plugin"
  depends=('neutron-common')
  conflics=('quantum-plugin-ryu')
  backup=('etc/neutron/plugins/ryu/ryu.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/ryu/ryu.ini ${pkgdir}/etc/neutron/plugins/ryu/ryu.ini
}

package_neutron-plugin-ryu-agent() {
  pkgdesc+=" - RYU plugin agent"
  depends=('neutron-common' 'neutron-plugin-ryu')
  conflics=('quantum-plugin-ryu-agent')

  cd tmp

  install -D -m 644 etc/neutron/rootwrap.d/ryu-plugin.filters \
                    ${pkgdir}/etc/neutron/rootwrap.d/ryu-plugin.filters
  install -D -m 755 usr/bin/neutron-ryu-agent ${pkgdir}/usr/bin/neutron-ryu-agent
  install -D -m 644 ${srcdir}/neutron-plugin-ryu-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-plugin-ryu-agent.service
}

package_neutron-plugin-vpn-agent() {
  pkgdesc+=" - VPN plugin agent"
  depends=('neutron-common')

  cd tmp

  install -D -m 640 etc/neutron/vpn_agent.ini \
                    ${pkgdir}/etc/neutron/vpn_agent.ini
  install -D -m 755 usr/bin/neutron-vpn-agent ${pkgdir}/usr/bin/neutron-vpn-agent
  install -D -m 644 ${srcdir}/neutron-plugin-vpn-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-plugin-vpn-agent.service
}

package_neutron-server() {
  pkgdesc+=" - server"
  depends=('neutron-common')
  optdepends=('neutron-plugin-openvswitch')
  conflics=('quantum-server')

  cd tmp

  install -D -m 644 ${srcdir}/neutron-server-default ${pkgdir}/etc/default/neutron-server
  install -D -m 755 usr/bin/neutron-server ${pkgdir}/usr/bin/neutron-server
  install -D -m 644 ${srcdir}/neutron-server.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-server.service
}

# vim:set ts=2 sw=2 et:
