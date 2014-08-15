# Maintainer: Lance Chen <cyen0312+aur@gmail.com>

pkgbase=neutron
pkgname=neutron
pkgname=('python2-neutron'
         'neutron-common'
         'neutron-dhcp-agent'
         'neutron-l3-agent'
         'neutron-lbaas-agent'
         'neutron-metadata-agent'
         'neutron-metering-agent'
         'neutron-plugin-bigswitch'
         'neutron-plugin-bigswitch-agent'
         'neutron-plugin-brocade'
         'neutron-plugin-cisco'
         'neutron-plugin-hyperv'
         'neutron-plugin-ibm'
         'neutron-plugin-ibm-agent'
         'neutron-plugin-linuxbridge'
         'neutron-plugin-linuxbridge-agent'
         'neutron-plugin-metaplugin'
         'neutron-plugin-metering-agent'
         'neutron-plugin-midonet'
         'neutron-plugin-ml2'
         'neutron-plugin-mlnx'
         'neutron-plugin-mlnx-agent'
         'neutron-plugin-nec'
         'neutron-plugin-nec-agent'
         'neutron-plugin-oneconvergence'
         'neutron-plugin-oneconvergence-agent'
         'neutron-plugin-openflow-agent'
         'neutron-plugin-openvswitch'
         'neutron-plugin-openvswitch-agent'
         'neutron-plugin-plumgrid'
         'neutron-plugin-ryu'
         'neutron-plugin-ryu-agent'
         'neutron-plugin-vmware'
         'neutron-server'
         'neutron-vpn-agent')

pkgver=2014.1.1
pkgrel=2
pkgdesc="A virtual network service for Openstack"
arch=(any)
url="https://launchpad.net/neutron"
license=('Apache')
install=neutron.install
depends=('python2' 'python2-setuptools')
makedepends=('python2-setuptools' 'python2-sphinx' 'python2-oslosphinx')
source=("$url/icehouse/2014.1.1/+download/$pkgbase-$pkgver.tar.gz"
        "neutron-bigswitch-agent.service"
        "neutron-dhcp-agent.service"
        "neutron-l3-agent.service"
        "neutron-lbaas-agent.service"
        "neutron-metadata-agent.service"
        "neutron-metering-agent.service"
        "neutron-ovs-cleanup.service"
        "neutron-plugin-ibm-agent.service"
        "neutron-plugin-linuxbridge-agent.service"
        "neutron-plugin-metering-agent.service"
        "neutron-plugin-mlnx-agent.service"
        "neutron-plugin-nec-agent.service"
        "neutron-plugin-oneconvergence-agent.service"
        "neutron-plugin-openflow-agent.service"
        "neutron-plugin-openvswitch-agent.service"
        "neutron-plugin-ryu-agent.service"
        "neutron-plugin-vpn-agent.service"
        "neutron-server-default"
        "neutron-server.service"
        "neutron_sudoers")

md5sums=('1d10f3e3f851c0232664b254eabc815a'
         'e0a25a272eaeb3b4f79404c2d2cd1379'
         'c59c436057efbb2317487a0822aa97e7'
         'ca5d870e84ca2cce40bab18bf770870f'
         'f080ddbe9b270c1ffd241db9723bc565'
         '1ab745acf0da636c4484803969229714'
         'b2dbb9c215a7cae496071f822b76bbd6'
         'e9450a02a73b96b84d9b7ab6c8778e70'
         'c954b9a3163fddac1623ec50ba7bfc98'
         '31ed220677df34466ca25fb1d64e9df0'
         'ef5a00d81ecea910fb29706e3181fc80'
         '926c8fe2ec3fd79955ed8f74109fceea'
         '50bc95405d91d73a583c508a0446e38c'
         'de6e4e853477f3116b515fa9e80b306f'
         'b8743fcf2673866dd05ad9495c12454d'
         '18c8afd01cf9f5d70d646b63d45b73db'
         '50946c6024c5043c7046968e6eb9b698'
         '9f2af5aef38b58a6b11f715059aecb95'
         'b7592a9c003001cf947673aea6dfb7a5'
         '913ffd71079722318751df2e3a63bdb3'
         '2cfc83f85ae2f8bc790e280da721262d')

prepare() {
  cd "$pkgbase-$pkgver"

  sed -i 's|/usr/sbin/dnsmasq|/usr/bin/dnsmasq|g' etc/neutron/rootwrap.d/dhcp.filters
}

build() {
  cd "$pkgbase-$pkgver"
  /usr/bin/python2 setup.py build
  /usr/bin/python2 setup.py build_sphinx
  /usr/bin/python2 setup.py install --root="$srcdir/tmp" \
                                    --install-data="/" \
                                    --optimize=1
  cp -R doc/build/man/ "$srcdir/tmp/"
}

package_python2-neutron() {
  pkgdesc+=" - Python library"
  install=python2-neutron.install
  depends=('python2-pip')
  conflics=('python2-quantum')

  cd tmp

  install -d "${pkgdir}/usr/lib/"
  cp -R usr/lib/ "${pkgdir}/usr/"
}

package_neutron-common() {
  pkgdesc+=" - common"
  install=neutron-common.install
  depends=('python2-neutron')
  conflics=('quantum-common')
  backup=('etc/neutron/api-paste.ini'
          'etc/neutron/neutron.conf')

  cd tmp

  install -d "${pkgdir}/etc/neutron/rootwrap.d/"
  install -m 640 etc/neutron/api-paste.ini "${pkgdir}/etc/neutron/"
  install -m 640 etc/neutron/fwaas_driver.ini "${pkgdir}/etc/neutron/"
  install -m 640 etc/neutron/l3_agent.ini "${pkgdir}/etc/neutron/"
  install -m 640 etc/neutron/neutron.conf "${pkgdir}/etc/neutron/"
  install -m 640 etc/neutron/policy.json "${pkgdir}/etc/neutron/"
  install -m 644 etc/neutron/rootwrap.conf "${pkgdir}/etc/neutron/"
  install -m 644 etc/neutron/rootwrap.d/debug.filters "${pkgdir}/etc/neutron/rootwrap.d/"
  install -m 644 etc/neutron/rootwrap.d/iptables-firewall.filters "${pkgdir}/etc/neutron/rootwrap.d/"
  install -m 644 etc/neutron/rootwrap.d/l3.filters "${pkgdir}/etc/neutron/rootwrap.d/"
  install -m 644 etc/neutron/rootwrap.d/vpnaas.filters "${pkgdir}/etc/neutron/rootwrap.d/"
  install -m 640 etc/neutron/vpn_agent.ini "${pkgdir}/etc/neutron/"
  
  install -d -m 0750 "${pkgdir}/etc/sudoers.d/"
  install -m 440 "${srcdir}/neutron_sudoers" "${pkgdir}/etc/sudoers.d/"

  install -d "${pkgdir}/usr/bin/"
  install -m 755 usr/bin/neutron-db-manage "${pkgdir}/usr/bin/"
  install -m 755 usr/bin/neutron-debug "${pkgdir}/usr/bin/"
  install -m 755 usr/bin/neutron-netns-cleanup "${pkgdir}/usr/bin/"
  install -m 755 usr/bin/neutron-ovs-cleanup "${pkgdir}/usr/bin/"
  install -m 755 usr/bin/neutron-rootwrap "${pkgdir}/usr/bin/"
  install -m 755 usr/bin/neutron-rootwrap-xen-dom0 "${pkgdir}/usr/bin/"
  install -m 755 usr/bin/neutron-usage-audit "${pkgdir}/usr/bin/"

  install -d "${pkgdir}/usr/share/man/man1/"
  cp -R man/* "${pkgdir}/usr/share/man/man1/"

  install -d -m 0755 "${pkgdir}/var/lib/neutron/"
  install -d -m 0755 "${pkgdir}/var/log/neutron/"
}

package_neutron-dhcp-agent() {
  pkgdesc+=" - DHCP agent"
  depends=('neutron-common' 'dnsmasq' 'neutron-metadata-agent')
  conflics=('quantum-dhcp-agent')
  backup=('etc/neutron/dhcp_agent.ini')

  cd tmp

  install -d "${pkgdir}/etc/neutron/rootwrap.d/"
  install -m 640 etc/neutron/dhcp_agent.ini "${pkgdir}/etc/neutron/"
  install -m 644 etc/neutron/rootwrap.d/dhcp.filters "${pkgdir}/etc/neutron/rootwrap.d/"

  install -d "${pkgdir}/usr/bin/"
  install -m 755 usr/bin/neutron-dhcp-agent "${pkgdir}/usr/bin/"

  install -D -m 644 "${srcdir}/neutron-dhcp-agent.service" \
                    "${pkgdir}/usr/lib/systemd/system/neutron-dhcp-agent.service"
}

package_neutron-l3-agent() {
  pkgdesc+=" - l3 agent"
  depends=('neutron-common' 'neutron-metadata-agent')
  conflics=('quantum-l3-agent')

  cd tmp

  install -D -m 755 usr/bin/neutron-l3-agent "${pkgdir}/usr/bin/neutron-l3-agent"

  install -D -m 644 "${srcdir}/neutron-l3-agent.service" \
                    "${pkgdir}/usr/lib/systemd/system/neutron-l3-agent.service"
}

package_neutron-lbaas-agent() {
  pkgdesc+=" - LBaaS agent"
  depends=('neutron-common' 'haproxy')
  conflics=('quantum-lbaas-agent')
  backup=('etc/neutron/lbaas_agent.ini')

  cd tmp

  install -d "${pkgdir}/etc/neutron/rootwrap.d/"
  install -m 640 etc/neutron/lbaas_agent.ini "${pkgdir}/etc/neutron/"
  install -m 644 etc/neutron/rootwrap.d/lbaas-haproxy.filters "${pkgdir}/etc/neutron/rootwrap.d/"

  install -D -m 755 usr/bin/neutron-lbaas-agent "${pkgdir}/usr/bin/neutron-lbaas-agent"

  install -D -m 644 "${srcdir}/neutron-lbaas-agent.service" \
                    "${pkgdir}/usr/lib/systemd/system/neutron-lbaas-agent.service"
}

package_neutron-metadata-agent() {
  pkgdesc+=" - metadata agent"
  depends=('neutron-common')
  conflics=('quantum-metadata-agent')
  backup=('etc/neutron/metadata_agent.ini')

  cd tmp

  install -D -m 640 etc/neutron/metadata_agent.ini "${pkgdir}/etc/neutron/metadata_agent.ini"

  install -d "${pkgdir}/usr/bin/"
  install -m 755 usr/bin/neutron-metadata-agent "${pkgdir}/usr/bin/"
  install -m 755 usr/bin/neutron-ns-metadata-proxy "${pkgdir}/usr/bin/"

  install -D -m 644 "${srcdir}/neutron-metadata-agent.service" \
                    "${pkgdir}/usr/lib/systemd/system/neutron-metadata-agent.service"
}

package_neutron-metering-agent() {
  pkgdesc+=" - metering agent"
  depends=('neutron-common')

  cd tmp

  install -D -m 640 etc/neutron/metering_agent.ini "${pkgdir}/etc/neutron/metering_agent.ini"

  install -D -m 755 usr/bin/neutron-metering-agent "${pkgdir}/usr/bin/neutron-metering-agent"

  install -D -m 644 "${srcdir}/neutron-metering-agent.service" \
                    "${pkgdir}/usr/lib/systemd/system/neutron-metering-agent.service"
}

package_neutron-plugin-bigswitch() {
  pkgdesc+=" - BigSwitch plugin"
  depends=('neutron-common')
  conflics=('quantum-plugin-bigswitch')
  backup=('etc/neutron/plugins/bigswitch/restproxy.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/bigswitch/restproxy.ini \
                    "${pkgdir}/etc/neutron/plugins/bigswitch/restproxy.ini"
  install -D -m 640 etc/neutron/plugins/bigswitch/README \
                    "${pkgdir}/etc/neutron/plugins/bigswitch/ca_certs/README"
  install -D -m 640 etc/neutron/plugins/bigswitch/README \
                    "${pkgdir}/etc/neutron/plugins/bigswitch/host_certs/README"
}

package_neutron-plugin-bigswitch-agent() {
  pkgdesc+=" - BigSwitch plugin agent"
  depends=('neutron-plugin-bigswitch')

  cd tmp

  install -D -m 755 usr/bin/neutron-restproxy-agent "${pkgdir}/usr/bin/neutron-restproxy-agent"

  install -D -m 644 "${srcdir}/neutron-bigswitch-agent.service" \
                    "${pkgdir}/usr/lib/systemd/system/neutron-bigswitch-agent.service"
}

package_neutron-plugin-brocade() {
  pkgdesc+=" - Brocade agent"
  depends=('neutron-common')
  conflics=('quantum-plugin-brocade')
  backup=('etc/neutron/plugins/brocade/brocade.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/brocade/brocade.ini \
                    "${pkgdir}/etc/neutron/plugins/brocade/brocade.ini"
}

package_neutron-plugin-cisco() {
  pkgdesc+=" - Cisco agent"
  depends=('neutron-common')
  conflics=('quantum-plugin-cisco')
  backup=('etc/neutron/plugins/cisco/cisco_plugins.ini')

  cd tmp

  install -d "${pkgdir}/etc/neutron/plugins/cisco/"
  install -m 640 etc/neutron/plugins/cisco/cisco_plugins.ini "${pkgdir}/etc/neutron/plugins/cisco/"
  install -m 640 etc/neutron/plugins/cisco/cisco_vpn_agent.ini "${pkgdir}/etc/neutron/plugins/cisco/"
}

package_neutron-plugin-hyperv() {
  pkgdesc+=" - Hyper-V plugin"
  depends=('neutron-common')
  conflics=('quantum-plugin-hyperv')
  backup=('etc/neutron/plugins/hyperv/hyperv_neutron_plugin.ini')

  cd tmp

  install -D -m 755 usr/bin/neutron-hyperv-agent "${pkgdir}/usr/bin/neutron-hyperv-agent"

  install -D -m 640 etc/neutron/plugins/hyperv/hyperv_neutron_plugin.ini \
                    "${pkgdir}/etc/neutron/plugins/hyperv/hyperv_neutron_plugin.ini"
}

package_neutron-plugin-ibm() {
  pkgdesc+=" - IBM SDN plugin"
  depends=('neutron-common')

  cd tmp

  install -D -m 640 etc/neutron/plugins/ibm/sdnve_neutron_plugin.ini \
                    "${pkgdir}/etc/neutron/plugins/ibm/sdnve_neutron_plugin.ini"
}

package_neutron-plugin-ibm-agent() {
  pkgdesc+=" - IBM SDN plugin agent"
  depends=('neutron-plugin-ibm')

  cd tmp

  install -D -m 755 usr/bin/neutron-ibm-agent "${pkgdir}/usr/bin/neutron-ibm-agent"

  install -D -m 644 "${srcdir}/neutron-plugin-ibm-agent.service" \
                    "${pkgdir}/usr/lib/systemd/system/neutron-plugin-ibm-agent.service"
}

package_neutron-plugin-linuxbridge() {
  pkgdesc+=" - linuxbridge plugin"
  depends=('neutron-common')
  conflics=('quantum-plugin-linuxbridge')
  backup=('etc/neutron/plugins/linuxbridge/linuxbridge_conf.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/linuxbridge/linuxbridge_conf.ini \
                    "${pkgdir}/etc/neutron/plugins/linuxbridge/linuxbridge_conf.ini"
}

package_neutron-plugin-linuxbridge-agent() {
  pkgdesc+=" - linuxbridge plugin agent"
  depends=('bridge-utils' 'neutron-plugin-linuxbridge')
  conflics=('quantum-plugin-linuxbridge-agent')

  cd tmp

  install -D -m 644 etc/neutron/rootwrap.d/linuxbridge-plugin.filters \
                    "${pkgdir}/etc/neutron/rootwrap.d/linuxbridge-plugin.filters"
  install -D -m 755 usr/bin/neutron-linuxbridge-agent "${pkgdir}/usr/bin/neutron-linuxbridge-agent"
  install -D -m 644 "${srcdir}/neutron-plugin-linuxbridge-agent.service" \
                    "${pkgdir}/usr/lib/systemd/system/neutron-plugin-linuxbridge-agent.service"
}

package_neutron-plugin-metaplugin() {
  pkgdesc+=" - Metaplugin plugin"
  depends=('neutron-common')
  conflics=('quantum-plugin-metaplugin')
  backup=('etc/neutron/plugins/metaplugin/metaplugin.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/metaplugin/metaplugin.ini \
                    "${pkgdir}/etc/neutron/plugins/metaplugin/metaplugin.ini"
}

package_neutron-plugin-metering-agent() {
  pkgdesc+=" - metering plugin agent"
  depends=('neutron-metering-agent')
}

package_neutron-plugin-midonet() {
  pkgdesc+=" - Midonet plugin"
  depends=('neutron-common')
  conflics=('quantum-plugin-midonet')
  backup=('etc/neutron/plugins/midonet/midonet.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/midonet/midonet.ini \
                    "${pkgdir}/etc/neutron/plugins/midonet/midonet.ini"
}

package_neutron-plugin-ml2() {
  pkgdesc+=" - ML2 plugin"
  depends=('neutron-common')
  backup=('etc/neutron/plugins/ml2/ml2_conf.ini'
          'etc/neutron/plugins/ml2/ml2_conf_arista.ini'
          'etc/neutron/plugins/ml2/ml2_conf_brocade.ini'
          'etc/neutron/plugins/ml2/ml2_conf_cisco.ini'
          'etc/neutron/plugins/ml2/ml2_conf_mlnx.ini'
          'etc/neutron/plugins/ml2/ml2_conf_ncs.ini'
          'etc/neutron/plugins/ml2/ml2_conf_odl.ini'
          'etc/neutron/plugins/ml2/ml2_conf_ofa.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/ml2/ml2_conf.ini \
                    "${pkgdir}/etc/neutron/plugins/ml2/ml2_conf.ini"
  install -D -m 640 etc/neutron/plugins/ml2/ml2_conf_arista.ini \
                    "${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_arista.ini"
  install -D -m 640 etc/neutron/plugins/ml2/ml2_conf_brocade.ini \
                    "${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_brocade.ini"
  install -D -m 640 etc/neutron/plugins/ml2/ml2_conf_cisco.ini \
                    "${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_cisco.ini"
  install -D -m 640 etc/neutron/plugins/ml2/ml2_conf_mlnx.ini \
                    "${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_mlnx.ini"
  install -D -m 640 etc/neutron/plugins/ml2/ml2_conf_ncs.ini \
                    "${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_ncs.ini"
  install -D -m 640 etc/neutron/plugins/ml2/ml2_conf_odl.ini \
                    "${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_odl.ini"
  install -D -m 640 etc/neutron/plugins/ml2/ml2_conf_ofa.ini \
                    "${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_ofa.ini"
}

package_neutron-plugin-mlnx() {
  pkgdesc+=" - MLNX plugin"
  depends=('neutron-common')
  backup=('etc/neutron/plugins/mlnx/mlnx_conf.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/mlnx/mlnx_conf.ini \
                    "${pkgdir}/etc/neutron/plugins/mlnx/mlnx_conf.ini"
}

package_neutron-plugin-mlnx-agent() {
  pkgdesc+=" - MLNX plugin agent"
  depends=('neutron-common' 'neutron-plugin-mlnx')

  cd tmp

  install -D -m 755 usr/bin/neutron-mlnx-agent "${pkgdir}/usr/bin/neutron-mlnx-agent"
  install -D -m 644 "${srcdir}/neutron-plugin-mlnx-agent.service" \
                    "${pkgdir}/usr/lib/systemd/system/neutron-plugin-mlnx-agent.service"
}

package_neutron-plugin-nec() {
  pkgdesc+=" - NEC plugin"
  depends=('neutron-common')
  conflics=('quantum-plugin-nec')
  backup=('etc/neutron/plugins/nec/nec.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/nec/nec.ini "${pkgdir}/etc/neutron/plugins/nec/nec.ini"
}

package_neutron-plugin-nec-agent() {
  pkgdesc+=" - NEC plugin agent"
  depends=('neutron-common' 'openvswitch' 'neutron-plugin-nec')
  conflics=('quantum-plugin-nec-agent')

  cd tmp

  install -D -m 644 etc/neutron/rootwrap.d/nec-plugin.filters \
                    "${pkgdir}/etc/neutron/rootwrap.d/nec-plugin.filters"
  install -D -m 755 usr/bin/neutron-nec-agent "${pkgdir}/usr/bin/neutron-nec-agent"
  install -D -m 644 "${srcdir}/neutron-plugin-nec-agent.service" \
                    "${pkgdir}/usr/lib/systemd/system/neutron-plugin-nec-agent.service"
}

package_neutron-plugin-oneconvergence() {
  pkgdesc+=" - One Covergence plugin"
  depends=('neutron-common')

  cd tmp

  install -D -m 640 etc/neutron/plugins/oneconvergence/nvsdplugin.ini \
                    "${pkgdir}/etc/neutron/plugins/oneconvergence/nvsdplugin.ini"
}

package_neutron-plugin-oneconvergence-agent() {
  pkgdesc+=" - One Covergence plugin agent"
  depends=('neutron-plugin-oneconvergence')

  cd tmp

  install -D -m 755 usr/bin/neutron-nvsd-agent "${pkgdir}/usr/bin/neutron-nvsd-agent"
  install -D -m 644 "${srcdir}/neutron-plugin-oneconvergence-agent.service" \
                    "${pkgdir}/usr/lib/systemd/system/neutron-plugin-oneconvergence-agent.service"
}

package_neutron-plugin-openflow-agent() {
  pkgdesc+=" - Openflow agent"
  depends=('neutron-plugin-ml2')

  cd tmp

  install -D -m 755 usr/bin/neutron-ofagent-agent "${pkgdir}/usr/bin/neutron-ofagent-agent"
  install -D -m 644 "${srcdir}/neutron-plugin-openflow-agent.service" \
                    "${pkgdir}/usr/lib/systemd/system/neutron-plugin-openflow-agent.service"
}

package_neutron-plugin-openvswitch() {
  pkgdesc+=" - Open vSwitch plugin"
  depends=('neutron-common')
  conflics=('quantum-plugin-openvswitch')
  backup=('etc/neutron/plugins/openvswitch/ovs_neutron_plugin.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/openvswitch/ovs_neutron_plugin.ini \
                    "${pkgdir}/etc/neutron/plugins/openvswitch/ovs_neutron_plugin.ini"
}

package_neutron-plugin-openvswitch-agent() {
  pkgdesc+=" - Open vSwitch plugin agent"
  depends=('openvswitch'
           'neutron-common'
           'neutron-plugin-ml2')
  conflics=('quantum-plugin-openvswitch-agent')

  cd tmp

  install -D -m 644 etc/neutron/rootwrap.d/openvswitch-plugin.filters \
                    "${pkgdir}/etc/neutron/rootwrap.d/openvswitch-plugin.filters"
  install -D -m 755 usr/bin/neutron-openvswitch-agent "${pkgdir}/usr/bin/neutron-openvswitch-agent"
  install -D -m 644 "${srcdir}/neutron-ovs-cleanup.service" \
                    "${pkgdir}/usr/lib/systemd/system/neutron-ovs-cleanup.service"
  install -D -m 644 "${srcdir}/neutron-plugin-openvswitch-agent.service" \
                    "${pkgdir}/usr/lib/systemd/system/neutron-plugin-openvswitch-agent.service"
}

package_neutron-plugin-plumgrid() {
  pkgdesc+=" - PLUMgrid plugin"
  depends=('neutron-common')
  conflics=('quantum-plugin-plumgrid')
  backup=('etc/neutron/plugins/plumgrid/plumgrid.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/plumgrid/plumgrid.ini \
                    "${pkgdir}/etc/neutron/plugins/plumgrid/plumgrid.ini"
}

package_neutron-plugin-ryu() {
  pkgdesc+=" - RYU plugin"
  depends=('neutron-common')
  conflics=('quantum-plugin-ryu')
  backup=('etc/neutron/plugins/ryu/ryu.ini')

  cd tmp

  install -D -m 640 etc/neutron/plugins/ryu/ryu.ini "${pkgdir}/etc/neutron/plugins/ryu/ryu.ini"
}

package_neutron-plugin-ryu-agent() {
  pkgdesc+=" - RYU plugin agent"
  depends=('neutron-plugin-ryu')
  conflics=('quantum-plugin-ryu-agent')

  cd tmp

  install -D -m 644 etc/neutron/rootwrap.d/ryu-plugin.filters \
                    "${pkgdir}/etc/neutron/rootwrap.d/ryu-plugin.filters"
  install -D -m 755 usr/bin/neutron-ryu-agent "${pkgdir}/usr/bin/neutron-ryu-agent"
  install -D -m 644 "${srcdir}/neutron-plugin-ryu-agent.service" \
                    "${pkgdir}/usr/lib/systemd/system/neutron-plugin-ryu-agent.service"
}

package_neutron-plugin-vmware() {
  pkgdesc+=" - VMware plugin"
  depends=('neutron-common')
  provides=('neutron-plugin-vmware')
  conflics=('neutron-plugin-nicira' 'quantum-plugin-nicira')

  cd tmp

  install -D -m 640 etc/neutron/plugins/vmware/nsx.ini "${pkgdir}/etc/neutron/plugins/vmware/nsx.ini"
  install -D -m 755 usr/bin/neutron-check-nsx-config "${pkgdir}/usr/bin/neutron-check-nsx-config"
  install -D -m 755 usr/bin/neutron-check-nvp-config "${pkgdir}/usr/bin/neutron-check-nvp-config"
  install -D -m 755 usr/bin/neutron-nsx-manage "${pkgdir}/usr/bin/neutron-nsx-manage"
}

package_neutron-server() {
  pkgdesc+=" - server"
  depends=('neutron-common')
  optdepends=('neutron-plugin-openvswitch')
  conflics=('quantum-server')

  cd tmp

  install -D -m 644 "${srcdir}/neutron-server-default" "${pkgdir}/etc/default/neutron-server"
  install -D -m 755 usr/bin/neutron-server "${pkgdir}/usr/bin/neutron-server"
  install -D -m 644 "${srcdir}/neutron-server.service" \
                    "${pkgdir}/usr/lib/systemd/system/neutron-server.service"
}

package_neutron-vpn-agent() {
  pkgdesc+=" - VPN agent"
  depends=('neutron-common' 'neutron-metadata-agent')
  provides=('neutron-plugin-vpn-agent')
  conflicts=('neutron-plugin-vpn-agent')

  cd tmp

  install -D -m 755 usr/bin/neutron-vpn-agent "${pkgdir}/usr/bin/neutron-vpn-agent"
  install -D -m 644 "${srcdir}/neutron-plugin-vpn-agent.service" \
                    "${pkgdir}/usr/lib/systemd/system/neutron-plugin-vpn-agent.service"
}

# vim:set ts=2 sw=2 et:
