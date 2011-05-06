#
# Contributor: Bart Kos (brointhemix), bro at fast-stable-secure dot net

pkgname=sova
pkgver=1.3
pkgrel=2
pkgdesc="Simplicity OVer Automation system configuration scriptset for Arch GNU/Linux."
arch=('i686' 'x86_64')
url="http://www.fast-stable-secure.net"
license="GPL2"
depends=('iproute2>=2.6.26')
backup=('etc/conf.d/network2' 'etc/conf.d/iptables2' 'etc/conf.d/misc2' 'etc/conf.d/smanager2' 'etc/conf.d/qos2')
source=(network2.rc network2 iptables2.rc iptables2 misc2.rc misc2 smanager2.rc smanager2 qos2.rc qos2 vcfg)

md5sums=('51c807eca5139cdd2b3402a1758a64d3'
         '38609ee8402c3a372d76c4d4ca4b1ccc'
         '1662d6d00fbd74b0ec5734532ba2728a'
         'e63b1a0837903cdb9b056fe30e20709a'
	 '252c73637d45081ead82694cb13eed16'
	 '4b0e33cf73f91705c0a7d5cdf7c21ced'
	 'a950c4db3f06cd0b52f19a8becc69ebb'
	 'a07c19e6667ca6aed40b916b95e53f86'
	 'f737a1f480a05dd65970ace0666eb710'
	 'bfc1868208201a021d67b2c14df6ef50'
	 '718401223e283000a8618332dfbbd220')

build() {
    install -D -m755 network2.rc $startdir/pkg/etc/rc.d/network2 || return 1
    install -D -m644 network2 $startdir/pkg/etc/conf.d/network2 || return 1
    install -D -m755 iptables2.rc $startdir/pkg/etc/rc.d/iptables2 || return 1
    install -D -m600 iptables2 $startdir/pkg/etc/conf.d/iptables2 || return 1
    install -D -m755 misc2.rc $startdir/pkg/etc/rc.d/misc2 || return 1
    install -D -m644 misc2 $startdir/pkg/etc/conf.d/misc2 || return 1
    install -D -m755 smanager2.rc $startdir/pkg/etc/rc.d/smanager2 || return 1
    install -D -m644 smanager2 $startdir/pkg/etc/conf.d/smanager2 || return 1
    install -D -m755 qos2.rc $startdir/pkg/etc/rc.d/qos2 || return 1
    install -D -m644 qos2 $startdir/pkg/etc/conf.d/qos2 || return 1

    install -D -m755 vcfg $startdir/pkg/usr/sbin/vcfg || return 1
}

# EOF
