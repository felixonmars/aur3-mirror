# Maintainer: Mr. Fillo <fillo@fillo.ru>
# Contributor: Mr. Fillo <fillo@fillo.ru>

pkgname=moothy
pkgver=1.1.3
pkgrel=1
pkgdesc="Smart Monitor Power Management based on the active windows"
arch=('any')
url="http://code.google.com/p/moothy"
license=('GPL')
depends=('pcre')
install="${pkgname}.install"
source=("http://moothy.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2"
        'moothy_conf'
        'moothy_rc')
md5sums=('7c6fd8395b37edbbbc7f86a6a2b7e376'
         '8652e0fb3edd242a84a50b848c5a5f6b'
         '4ac616b1e09662d19f57982cc0109799')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./make -m

  install -D -m755 "moothy" "${pkgdir}/usr/bin/moothy"
  install -D -m755 "${srcdir}/moothy_rc" "${pkgdir}/etc/rc.d/moothy"
  install -D -m644 "${srcdir}/moothy_conf" "${pkgdir}/etc/conf.d/moothy"

  install -d "${pkgdir}/usr/share/moothy"
  install -D -m755 "scripts/xscreensaver" "${pkgdir}/usr/share/moothy/xscreensaver"
  install -D -m755 "scripts/simple" "${pkgdir}/usr/share/moothy/simple"
}
