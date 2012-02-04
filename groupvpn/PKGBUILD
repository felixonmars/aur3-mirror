# Maintainer: Shanto <shanto@hotmail.com>
# NOTE: Please refer to the official website before installing this. You need a config file generated from the website in addition to this package.

pkgname=groupvpn
pkgver=9.6.0
pkgrel=1
pkgdesc="Group based implementation of the ACIS P2P stack (a.k.a Brunet/IPOP). Like Hamachi, Tinc or n2n."
arch=('i686' 'x86_64')
url="https://www.grid-appliance.org/wiki/index.php/GroupVPN"
license=('GPL')
depends=('mono' 'uml_utilities' 'cronolog' 'python2')
#optdepends=()
makedepends=('unzip')
conflicts=()
provides=()
install=${pkgname}.install
source=(
	http://www.grid-appliance.org/files/ipop/acisp2p.${pkgver}.zip
	groupvpn.patch
)
build() {
	cd $srcdir/acisp2p
	
	patch -p1 -i ${srcdir}/groupvpn.patch
	
	mkdir -p ${pkgdir}/opt/${pkgname}/{bin,etc,lib,var}
	cp ./bin/*.exe ${pkgdir}/opt/${pkgname}/bin/
	cp ./bin/*.dll ${pkgdir}/opt/${pkgname}/lib/
	cp ./bin/*.py ${pkgdir}/opt/${pkgname}/bin/
	cp ./bin/*.sh ${pkgdir}/opt/${pkgname}/bin/
	cp ./config/ipop.vpn.config ${pkgdir}/opt/${pkgname}/etc/
	cp ./config/Log.config ${pkgdir}/opt/${pkgname}/bin/DhtIpopNode.exe.config
	
	mkdir -p ${pkgdir}/{etc/rc.d,usr/sbin}
	ln -sf /opt/${pkgname}/bin/groupvpn_prepare.sh ${pkgdir}/usr/sbin/groupvpn-prepare
	ln -sf /opt/${pkgname}/bin/groupvpn.sh ${pkgdir}/etc/rc.d/groupvpn
	ln -sf /opt/${pkgname}/bin/groupvpn_bootstrap.sh ${pkgdir}/etc/rc.d/groupvpn-bootstrap
	ln -sf /opt/${pkgname}/etc/ipop.vpn.config ${pkgdir}/etc/
}
md5sums=(
	'09fb52a5c0ab707f552847930a7fdb01'
	'96d28ac191a7f2edbef3bac440e0715d'
)
