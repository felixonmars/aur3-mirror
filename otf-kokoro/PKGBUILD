# Maintainer: kusanaginoturugi <kusanaginoturugi atmark gmail period com>

pkgname=otf-kokoro
pkgver=1
pkgrel=3
pkgdesc="Japanese slender font (Mincho-style) based on IPA Font v3"
arch=('any')
url="http://typingart.net/"
license=('custom')
install=otf.install
source=(http://typingart.net/font/kokoro.zip)

package() {
  cd ${srcdir}/

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 IPA_Font_License_Agreement_v1.0.txt \
                read_me.txt \
                "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('a4aec0cda52c8291dd692e1ebc0deae2')
