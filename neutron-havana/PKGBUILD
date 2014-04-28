# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgbase=neutron-havana
pkgname=neutron-havana
true && pkgname=('python2-neutron-havana'
                 'neutron-dhcp-agent-havana'
                 'neutron-l3-agent-havana'
                 'neutron-lbaas-agent-havana'
                 'neutron-metadata-agent-havana'
                 'neutron-plugin-bigswitch-havana'
                 'neutron-plugin-brocade-havana'
                 'neutron-plugin-cisco-havana'
                 'neutron-plugin-hyperv-havana'
                 'neutron-plugin-linuxbridge-havana'
                 'neutron-plugin-linuxbridge-agent-havana'
                 'neutron-plugin-metaplugin-havana'
                 'neutron-plugin-metering-agent-havana'
                 'neutron-plugin-midonet-havana'
                 'neutron-plugin-mlnx-agent-havana'
                 'neutron-plugin-nec-havana'
                 'neutron-plugin-nec-agent-havana'
                 'neutron-plugin-nicira-havana'
                 'neutron-plugin-openvswitch-havana'
                 'neutron-plugin-openvswitch-agent-havana'
                 'neutron-plugin-plumgrid-havana'
                 'neutron-plugin-ryu-havana'
                 'neutron-plugin-ryu-agent-havana'
                 'neutron-plugin-vpn-agent-havana'
                 'neutron-havana')

pkgver=2013.2.3
pkgrel=1
pkgdesc="A virtual network service for Openstack Havana"
arch=(any)
url="https://launchpad.net/neutron"
license=('Apache')
depends=('python2' 'python2-setuptools')
makedepends=('python2-setuptools' 'python2-sphinx' 'python2-oslo-sphinx')
source=("$url/havana/2013.2.3/+download/neutron-$pkgver.tar.gz"
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
        "neutron_sudoers"
        "neutron.plugin.openvswitch.install")
md5sums=('3404987adec035fb4588d858040da41f'
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
         '7c710afee7078e7a52d3708acd158c26'
         '2cfc83f85ae2f8bc790e280da721262d'
         'fd68f680bfa312a0a17c705924cfe662')

build() {
  cd "neutron-$pkgver"
  /usr/bin/python2 setup.py build
  /usr/bin/python2 setup.py build_sphinx
  /usr/bin/python2 setup.py install --root="$srcdir/tmp" --install-data="/" --optimize=1
  cp -R doc/build/man/ "$srcdir/tmp/"
}

package_python2-neutron-havana() {
  pkgdesc+=" - Python library"
  depends=('python2-pbr>=0.5.21'
           'python2-pbr<1.0'
           'python2-paste'
           'python2-paste-deploy>=1.5.0'
           'python2-routes>=1.12.3'
           'python2-amqplib>=0.6.1'
           'python2-amqp'
           'python2-anyjson>=0.3.3'
           'python2-argparse'
           'python2-babel>=1.3'
           'python2-eventlet>=0.13.0'
           'python2-greenlet>=0.3.2'
           'python2-httplib2'
           'python2-requests>=1.1'
           'python2-iso8601>=0.1.8'
           'python2-jsonrpclib'
           'python2-jinja'
           'python2-kombu>=2.4.8'
           'python2-netaddr'
           'python2-neutronclient>=2.3.4'
           'python2-neutronclient<3.0.0'
           'python2-sqlalchemy-havana'
           'python2-webob-havana>=1.2.3'
           'python2-webob-havana<1.3'
           'python2-keystoneclient>=0.3.2'
           'python2-alembic>=0.4.1'
           'python2-six>=1.4.1'
           'python2-stevedore>=0.10'
           'python2-oslo-config>=1.2.0'
           'python2-novaclient>=2.15.0')
  conflics=('python2-quantum' 'python2-neutron')
  cd tmp

  install -d ${pkgdir}/usr/lib/
  cp -R usr/lib/ ${pkgdir}/usr/
}


package_neutron-dhcp-agent-havana() {
  pkgdesc+=" - DHCP agent"
  depends=('neutron-havana' 'dnsmasq' 'neutron-metadata-agent-havana')
  conflics=('quantum-dhcp-agent' 'neutron-dhcp-agent')
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

package_neutron-l3-agent-havana() {
  pkgdesc+=" - l3 agent"
  depends=('neutron-havana' 'neutron-metadata-agent-havana')
  conflics=('quantum-l3-agent' 'neutron-l3-agent')
  backup=('etc/neutron/l3_agent.ini')

  cd tmp

  install -d ${pkgdir}/etc/neutron/rootwrap.d/
  install -m 640 etc/neutron/l3_agent.ini ${pkgdir}/etc/neutron/
  install -m 644 etc/neutron/rootwrap.d/l3.filters ${pkgdir}/etc/neutron/rootwrap.d/

  install -D -m 755 usr/bin/neutron-l3-agent ${pkgdir}/usr/bin/neutron-l3-agent

  install -D -m 644 ${srcdir}/neutron-l3-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-l3-agent.service
}

package_neutron-lbaas-agent-havana() {
  pkgdesc+=" - LBaaS agent"
  depends=('neutron-havana' 'neutron-metadata-agent-havana' 'haproxy')
  conflics=('quantum-lbaas-agent' 'neutron-lbaas-agent')
  backup=('etc/neutron/lbaas_agent.ini')

  cd tmp

  install -d ${pkgdir}/etc/neutron/rootwrap.d/
  install -m 640 etc/neutron/lbaas_agent.ini ${pkgdir}/etc/neutron/
  install -m 644 etc/neutron/rootwrap.d/lbaas-haproxy.filters ${pkgdir}/etc/neutron/rootwrap.d/

  install -D -m 755 usr/bin/neutron-lbaas-agent ${pkgdir}/usr/bin/neutron-lbaas-agent

  install -D -m 644 ${srcdir}/neutron-lbaas-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-lbaas-agent.service
}

package_neutron-metadata-agent-havana() {
  pkgdesc+=" - metadata agent"
  depends=('neutron-havana')
  conflics=('quantum-metadata-agent' 'neutron-metadata-agent')
  backup=('etc/neutron/metadata_agent.ini')

  cd tmp

  install -D -m 640 etc/neutron/metadata_agent.ini ${pkgdir}/etc/neutron/metadata_agent.ini

  install -d ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-metadata-agent ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-ns-metadata-proxy ${pkgdir}/usr/bin/

  install -D -m 644 ${srcdir}/neutron-metadata-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-metadata-agent.service
}

package_neutron-plugin-bigswitch-havana() {
  pkgdesc+=" - BigSwitch agent"
  depends=('neutron-havana')
  conflics=('quantum-plugin-bigswitch' 'neutron-plugin-bigswtich')
  backup=('etc/neutron/plugins/bigswitch/restproxy.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/bigswitch/restproxy.ini \
                    ${pkgdir}/etc/neutron/plugins/bigswitch/restproxy.ini
}

package_neutron-plugin-brocade-havana() {
  pkgdesc+=" - Brocade agent"
  depends=('neutron-havana')
  conflics=('quantum-plugin-brocade' 'neutron-plugin-brocade')
  backup=('etc/neutron/plugins/brocade/brocade.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/brocade/brocade.ini \
                    ${pkgdir}/etc/neutron/plugins/brocade/brocade.ini
}

package_neutron-plugin-cisco-havana() {
  pkgdesc+=" - Cisco agent"
  depends=('neutron-havana')
  conflics=('quantum-plugin-cisco' 'neutron-plugin-cisco')
  backup=('etc/neutron/plugins/cisco/cisco_plugins.ini')

  cd tmp

  install -d ${pkgdir}/etc/neutron/plugins/cisco/
  install -m 640 etc/neutron/plugins/cisco/cisco_plugins.ini ${pkgdir}/etc/neutron/plugins/cisco/
}

package_neutron-plugin-hyperv-havana() {
  pkgdesc+=" - Hyper-V plugin"
  depends=('neutron-havana')
  conflics=('quantum-plugin-hyperv' 'neutron-plugin-hyperv')
  backup=('etc/neutron/plugins/hyperv/hyperv_neutron_plugin.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/hyperv/hyperv_neutron_plugin.ini \
                    ${pkgdir}/etc/neutron/plugins/hyperv/hyperv_neutron_plugin.ini
}

package_neutron-plugin-linuxbridge-havana() {
  pkgdesc+=" - linuxbridge plugin"
  depends=('neutron-havana')
  conflics=('quantum-plugin-linuxbridge' 'neutron-plugin-linuxbridge')
  backup=('etc/neutron/plugins/linuxbridge/linuxbridge_conf.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/linuxbridge/linuxbridge_conf.ini \
                    ${pkgdir}/etc/neutron/plugins/linuxbridge/linuxbridge_conf.ini
}

package_neutron-plugin-linuxbridge-agent-havana() {
  pkgdesc+=" - linuxbridge plugin agent"
  depends=('neutron-havana' 'bridge-utils' 'neutron-plugin-linuxbridge-havana')
  conflics=('quantum-plugin-linuxbridge-agent' 'neutron-plugin-linuxbridge-agent')

  cd tmp

  install -D -m 644 etc/neutron/rootwrap.d/linuxbridge-plugin.filters \
                    ${pkgdir}/etc/neutron/rootwrap.d/linuxbridge-plugin.filters
  install -D -m 755 usr/bin/neutron-linuxbridge-agent ${pkgdir}/usr/bin/neutron-linuxbridge-agent
  install -D -m 644 ${srcdir}/neutron-plugin-linuxbridge-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-plugin-linuxbridge-agent.service
}

package_neutron-plugin-metaplugin-havana() {
  pkgdesc+=" - Metaplugin plugin"
  depends=('neutron-havana')
  conflics=('quantum-plugin-metaplugin' 'neutron-plugin-metaplugin')
  backup=('etc/neutron/plugins/metaplugin/metaplugin.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/metaplugin/metaplugin.ini \
                    ${pkgdir}/etc/neutron/plugins/metaplugin/metaplugin.ini
}

package_neutron-plugin-metering-agent-havana() {
  pkgdesc+=" - metering plugin agent"
  depends=('neutron-havana')
  conflics=('neutron-plugin-metering-agent')
  backup=('etc/neutron/metering_agent.ini')

  cd tmp

  install -D -m 640 etc/neutron/metering_agent.ini ${pkgdir}/etc/neutron/metering_agent.ini
  install -D -m 755 usr/bin/neutron-metering-agent ${pkgdir}/usr/bin/neutron-metering-agent
  install -D -m 644 ${srcdir}/neutron-plugin-metering-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-plugin-metering-agent.service
}

package_neutron-plugin-midonet-havana() {
  pkgdesc+=" - Midonet plugin"
  depends=('neutron-havana')
  conflics=('quantum-plugin-midonet' 'neutron-plugin-midonet')
  backup=('etc/neutron/plugins/midonet/midonet.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/midonet/midonet.ini \
                    ${pkgdir}/etc/neutron/plugins/midonet/midonet.ini
}

package_neutron-plugin-mlnx-agent-havana() {
  pkgdesc+=" - MLNX plugin agent"
  depends=('neutron-havana')
  conflics=('neutron-plugin-mlnx-agent')
  backup=('etc/neutron/plugins/mlnx/mlnx_conf.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/mlnx/mlnx_conf.ini \
                    ${pkgdir}/etc/neutron/plugins/mlnx/mlnx_conf.ini
  install -D -m 755 usr/bin/neutron-mlnx-agent ${pkgdir}/usr/bin/neutron-mlnx-agent
  install -D -m 644 ${srcdir}/neutron-plugin-mlnx-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-plugin-mlnx-agent.service
}

package_neutron-plugin-nec-havana() {
  pkgdesc+=" - NEC plugin"
  depends=('neutron-havana')
  conflics=('quantum-plugin-nec' 'neutron-plugin-nec')
  backup=('etc/neutron/plugins/nec/nec.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/nec/nec.ini ${pkgdir}/etc/neutron/plugins/nec/nec.ini
}

package_neutron-plugin-nec-agent-havana() {
  pkgdesc+=" - NEC plugin agent"
  depends=('neutron-havana' 'openvswitch' 'neutron-plugin-nec-havana')
  conflics=('quantum-plugin-nec-agent' 'neutron-plugin-nec-agent')

  cd tmp

  install -D -m 644 etc/neutron/rootwrap.d/nec-plugin.filters \
                    ${pkgdir}/etc/neutron/rootwrap.d/nec-plugin.filters
  install -D -m 755 usr/bin/neutron-nec-agent ${pkgdir}/usr/bin/neutron-nec-agent
  install -D -m 644 ${srcdir}/neutron-plugin-nec-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-plugin-nec-agent.service
}

package_neutron-plugin-nicira-havana() {
  pkgdesc+=" - Nicira plugin"
  depends=('neutron-havana')
  conflics=('quantum-plugin-nicira' 'neutron-plugin-nicira')
  backup=('etc/neutron/plugins/nicira/nvp.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/nicira/nvp.ini ${pkgdir}/etc/neutron/plugins/nicira/nvp.ini
  install -D -m 755 usr/bin/neutron-check-nvp-config ${pkgdir}/usr/bin/neutron-check-nvp-config
}

package_neutron-plugin-openvswitch-havana() {
  pkgdesc+=" - Open vSwitch plugin"
  install=neutron.plugin.openvswitch.install
  depends=('neutron-havana')
  conflics=('quantum-plugin-openvswitch' 'neutron-plugin-openvswitch')
  backup=('etc/neutron/plugins/openvswitch/ovs_neutron_plugin.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/openvswitch/ovs_neutron_plugin.ini \
                    ${pkgdir}/etc/neutron/plugins/openvswitch/ovs_neutron_plugin.ini
}

package_neutron-plugin-openvswitch-agent-havana() {
  pkgdesc+=" - Open vSwitch plugin agent"
  depends=('openvswitch'
           'neutron-havana'
           'neutron-plugin-openvswitch-havana')
  conflics=('quantum-plugin-openvswitch-agent' 'neutron-plugin-openvswitch-agent')
  cd tmp

  install -D -m 644 etc/neutron/rootwrap.d/openvswitch-plugin.filters \
                    ${pkgdir}/etc/neutron/rootwrap.d/openvswitch-plugin.filters
  install -D -m 755 usr/bin/neutron-openvswitch-agent ${pkgdir}/usr/bin/neutron-openvswitch-agent
  install -D -m 644 ${srcdir}/neutron-plugin-openvswitch-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-plugin-openvswitch-agent.service
}

package_neutron-plugin-plumgrid-havana() {
  pkgdesc+=" - PLUMgrid plugin"
  depends=('neutron-havana')
  conflics=('quantum-plugin-plumgrid' 'neutron-plugin-plumgrid')
  backup=('etc/neutron/plugins/plumgrid/plumgrid.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/plumgrid/plumgrid.ini \
                    ${pkgdir}/etc/neutron/plugins/plumgrid/plumgrid.ini
}

package_neutron-plugin-ryu-havana() {
  pkgdesc+=" - RYU plugin"
  depends=('neutron-havana')
  conflics=('quantum-plugin-ryu' 'neutron-plugin-ryu')
  backup=('etc/neutron/plugins/ryu/ryu.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/ryu/ryu.ini ${pkgdir}/etc/neutron/plugins/ryu/ryu.ini
}

package_neutron-plugin-ryu-agent-havana() {
  pkgdesc+=" - RYU plugin agent"
  depends=('neutron-havana' 'neutron-plugin-ryu-havana')
  conflics=('quantum-plugin-ryu-agent' 'neutron-plugin-ryu-agent')

  cd tmp

  install -D -m 644 etc/neutron/rootwrap.d/ryu-plugin.filters \
                    ${pkgdir}/etc/neutron/rootwrap.d/ryu-plugin.filters
  install -D -m 755 usr/bin/neutron-ryu-agent ${pkgdir}/usr/bin/neutron-ryu-agent
  install -D -m 644 ${srcdir}/neutron-plugin-ryu-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-plugin-ryu-agent.service
}

package_neutron-plugin-vpn-agent-havana() {
  pkgdesc+=" - VPN plugin agent"
  depends=('neutron-havana')
  conflics=('neutron-plugin-vpn-agent')
  cd tmp

  install -D -m 640 etc/neutron/vpn_agent.ini \
                    ${pkgdir}/etc/neutron/vpn_agent.ini
  install -D -m 755 usr/bin/neutron-vpn-agent ${pkgdir}/usr/bin/neutron-vpn-agent
  install -D -m 644 ${srcdir}/neutron-plugin-vpn-agent.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-plugin-vpn-agent.service
}


package_neutron-havana() {
  pkgdesc+=" - Server"
  install=neutron.install
  depends=('python2-neutron-havana')
  conflics=('quantum-common' 'quantum-server' 'neutron-common' 'neutron-server')
  optdepends=('neutron-plugin-openvswitch-havana')
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

  install -d ${pkgdir}/usr/share/man/man1/
  cp -R man/* ${pkgdir}/usr/share/man/man1/

  install -d -m 0750 ${pkgdir}/etc/sudoers.d/
  install -m 440 ${srcdir}/neutron_sudoers ${pkgdir}/etc/sudoers.d/

  install -d -m 0770 ${pkgdir}/var/lib/neutron/
  install -d -m 0770 ${pkgdir}/var/log/neutron/

  install -D -m 644 ${srcdir}/neutron-server-default ${pkgdir}/etc/default/neutron-server
  install -D -m 755 usr/bin/neutron-server ${pkgdir}/usr/bin/neutron-server
  install -D -m 644 ${srcdir}/neutron-server.service \
                    ${pkgdir}/usr/lib/systemd/system/neutron-server.service
}

