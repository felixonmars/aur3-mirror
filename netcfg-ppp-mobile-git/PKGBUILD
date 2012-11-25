# Maintainer: Robbie Smith <zoqaeski AT gmail DOT com>
# Contributor: Robbie Smith <zoqaeski AT gmail DOT com>
pkgname=netcfg-ppp-mobile-git
pkgver=20121121
pkgrel=1
pkgdesc="PPP (mobile) support for netcfg (Git version). "
url="https://wiki.archlinux.org/index.php/3G_and_GPRS_modems_with_pppd"
arch=(i686 x86_64)
license=('GPL')
depends=('netcfg>=2.5' 'ppp')
makedepends=('git')
provides=(netcfg-ppp-mobile)
conflicts=(netcfg-ppp-mobile)
#source=(ppp-mobile.tar.xz)
install=netcfg-ppp-mobile.install
backup=(etc/ppp/options-mobile)

_gitroot="git://github.com/zoqaeski/netcfg-ppp-mobile.git"
_gitname="ppp-mobile"

sha256sums=('15b7b744b9e814e5fef24cc2b0813e2e4ecbff4203342c5e9ae8024b69462bd4')

build() {
	cd "${srcdir}"
	msg "Connecting to GIT server..."
	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi
	msg "GIT checkout done or server timeout"
}

package() {
	cp -rv "$_gitname/etc" "${pkgdir}/"
#	install -D "${blddir}/etc" "${pkgdir}/"
#	install -Dm644 "${blddir}/ppp-mobile" "${pkgdir}/etc/network.d/examples/"
#	install -Dm644 "${blddir}/options-mobile" "${pkgdir}/etc/ppp/"
#	install -D "${blddir}/apn" "${pkgdir}/etc/ppp/chatscripts/"
#	install -Dm644 "${blddir}/apn.iinet" "${pkgdir}/etc/ppp/chatscripts/"
#	install -Dm644 "${blddir}/apn.optus-prepaid" "${pkgdir}/etc/ppp/chatscripts/"
#	install -Dm644 "${blddir}/mobile-modem.chat" "${pkgdir}/etc/ppp/chatscripts/"
#	install -D "${blddir}/mode" "${pkgdir}/etc/ppp/chatscripts/"
#	install -Dm644 "${blddir}/mode.3G-only" "${pkgdir}/etc/ppp/chatscripts/"
#	install -Dm644 "${blddir}/mode.3G-pref" "${pkgdir}/etc/ppp/chatscripts/"
#	install -Dm644 "${blddir}/mode.GPRS-only" "${pkgdir}/etc/ppp/chatscripts/"
#	install -Dm644 "${blddir}/mode.GPRS-pref" "${pkgdir}/etc/ppp/chatscripts/"
#	install -Dm644 "${blddir}/mode.NONE" "${pkgdir}/etc/ppp/chatscripts/"
#	install -D "${blddir}/pin" "${pkgdir}/etc/ppp/chatscripts/"
#	install -Dm644 "${blddir}/pin.NONE" "${pkgdir}/etc/ppp/chatscripts/"
#	install -Dm644 "${blddir}/mobile-noauth" "${pkgdir}/etc/ppp/peers/"
}
