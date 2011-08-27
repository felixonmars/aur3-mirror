pkgname=blackvpn
pkgver=1
pkgrel=1
pkgdesc="a secure, encrypted, private communication tunnel between two or more devices across a public network (like the Internet)."
arch=(any)
url="https://www.blackvpn.com"
license=('custom')
depends=('openvpn')
source=(https://www.blackvpn.com/content/uploads/blackvpn.zip)

package() {
	# you should chose one of the following configs depending on which service you want to use. I set the default to usa
	#install -Dm644 "${srcdir}/blackvpn_lithuania.conf" "${pkgdir}/etc/openvpn/blackvpn_lithuania.conf"
	#install -Dm644 "${srcdir}/blackvpn_netherlands.conf" "${pkgdir}/etc/openvpn/blackvpn_netherlands.conf"
	#install -Dm644 "${srcdir}/blackvpn_uk.conf" "${pkgdir}/etc/openvpn/blackvpn_uk.conf"
	install -Dm644 "${srcdir}/blackvpn_usa.conf" "${pkgdir}/etc/openvpn/blackvpn_usa.conf"

	install -Dm644 "${srcdir}/ssl/ca.crt" "${pkgdir}/etc/openvpn/ssl/ca.crt"
	install -Dm644 "${srcdir}/ssl/ta.key" "${pkgdir}/etc/openvpn/ssl/ta.key"
} 
md5sums=('d285e1bb9fe89b65eda685dae7c2e094')
