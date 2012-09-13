# Maintainer: Whoever wrote that fine wiki article.
# Contributor: Robbie Smith <zoqaeski AT gmail DOT com>
pkgname=netcfg-ppp-mobile
pkgver=1.0
pkgrel=1
pkgdesc="PPP (mobile) support for NETCFG. "
url="https://wiki.archlinux.org/index.php/3G_and_GPRS_modems_with_pppd"
arch=(i686 x86_64)
license=('GPL')
depends=('netcfg>=2.5' 'ppp')
source=(ppp-mobile.tar.xz)
sha256sums=('15b7b744b9e814e5fef24cc2b0813e2e4ecbff4203342c5e9ae8024b69462bd4')

#build() {
#	# Nothing to do here
#}

package() {
	mkdir -p "${pkgdir}/etc/network.d/examples"
	mkdir -p "${pkgdir}/etc/ppp/chatscripts"
	mkdir -p "${pkgdir}/etc/ppp/peers"
	install -D "${srcdir}/ppp-mobile" "${pkgdir}/etc/network.d/examples/"
	install -D "${srcdir}/options-mobile" "${pkgdir}/etc/ppp/"
	install -D "${srcdir}/apn" "${pkgdir}/etc/ppp/chatscripts/"
	install -D "${srcdir}/apn.iinet" "${pkgdir}/etc/ppp/chatscripts/"
	install -D "${srcdir}/apn.optus-prepaid" "${pkgdir}/etc/ppp/chatscripts/"
	install -D "${srcdir}/mobile-modem.chat" "${pkgdir}/etc/ppp/chatscripts/"
	install -D "${srcdir}/mode" "${pkgdir}/etc/ppp/chatscripts/"
	install -D "${srcdir}/mode.3G-only" "${pkgdir}/etc/ppp/chatscripts/"
	install -D "${srcdir}/mode.3G-pref" "${pkgdir}/etc/ppp/chatscripts/"
	install -D "${srcdir}/mode.GPRS-only" "${pkgdir}/etc/ppp/chatscripts/"
	install -D "${srcdir}/mode.GPRS-pref" "${pkgdir}/etc/ppp/chatscripts/"
	install -D "${srcdir}/mode.NONE" "${pkgdir}/etc/ppp/chatscripts/"
	install -D "${srcdir}/pin" "${pkgdir}/etc/ppp/chatscripts/"
	install -D "${srcdir}/pin.NONE" "${pkgdir}/etc/ppp/chatscripts/"
	install -D "${srcdir}/mobile-noauth" "${pkgdir}/etc/ppp/peers/"
}
