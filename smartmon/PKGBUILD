# Maintainer: Mr. Fillo <fillo@fillo.ru>
# Contributor: Mr. Fillo <fillo@fillo.ru>

pkgname=smartmon
pkgver=1.0.0
pkgrel=1
pkgdesc="This is a small daemon that can monitor power control, run custom scripts after the specified time, and rely on open windows in a choice of action."
arch=('any')
url="http://code.google.com/p/smartmon"
license=('GPL')
depends=('pcre')
install="${pkgname}.install"
source=("http://smartmon.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2"
        'smartmon_conf'
        'smartmon_rc')
md5sums=('929463c1f33fae0c063dae45acb37313'
         'dc4f9b3096aae76c4dddfd8fbeefbe62'
         'ae7cf4e3ce0f89756abb51c1c980dfbc')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./make -m

  install -D -m755 "smartmon" "${pkgdir}/usr/bin/smartmon"
  install -D -m755 "${srcdir}/smartmon_rc" "${pkgdir}/etc/rc.d/smartmon"
  install -D -m644 "${srcdir}/smartmon_conf" "${pkgdir}/etc/conf.d/smartmon"

  install -d "${pkgdir}/usr/share/smartmon"
  install -D -m755 "scripts/xscreensaver" "${pkgdir}/usr/share/smartmon/xscreensaver"
  install -D -m755 "scripts/simple" "${pkgdir}/usr/share/smartmon/simple"
}
