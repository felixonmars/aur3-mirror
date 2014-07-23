# Maintainer: Markus Weimar <mail at markusweimar dot de>
pkgname=otf-fira-sans
epoch=1
pkgver=3.111
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="A sans-serif typeface designed for Firefox OS."
arch=('any')
url="https://www.mozilla.org/en-US/styleguide/products/firefox-os/typeface/"
license=('custom:OFL')
source=("http://www.markusweimar.de/public/otf-fira-sans-3.111.tar.xz")
install=${pkgname}.install
md5sums=('6aa233533c292b085fbaf2947fe402fe')

package() {
  cd ${srcdir}/otf-fira-sans-${pkgver}
  install -d ${pkgdir}/usr/share/fonts/OTF/
  install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
  install -D -m644 OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
