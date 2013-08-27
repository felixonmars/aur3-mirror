# Maintainer: daniellee219 <daniellee0219@gmail.com>

pkgname=zjuvpn
pkgver=8.2
pkgrel=1
pkgdesc="VPN control script for VPN users in Zhejiang University"
arch=('any')
url="http://networking.zju.edu.cn"
license=('GPL')
depends=(xl2tpd)
source=(
	zjuvpn
	options
	xl2tpd.conf-example
)
md5sums=(
	'84b6138f876fec1edf77ede58e435bbf'
	'3257fd2fbd015b967b3feac70d4a0e8b'
	'39578ae17564005552da90d741e5c507'
)
install=${pkgname}.install

package() {
	cd "${srcdir}"

	install -Dm755 zjuvpn "${pkgdir}/usr/sbin/zjuvpn"
	install -dm755 "${pkgdir}/usr/share/zjuvpn"
	install -Dm644 options "${pkgdir}/usr/share/zjuvpn/options"
	install -Dm644 xl2tpd.conf-example "${pkgdir}/usr/share/zjuvpn/xl2tpd.conf-example"
}
