# Maintainer: Markus Weimar <mail at markusweimar dot de>
pkgname=otf-fira-mono
epoch=1
pkgver=3.111
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="A monospace typeface designed for Firefox OS."
arch=('any')
url="https://www.mozilla.org/en-US/styleguide/products/firefox-os/typeface/"
license=('custom:OFL')
source=("http://www.markusweimar.de/public/otf-fira-mono-3.111.tar.xz")
install=${pkgname}.install
md5sums=('13565a378c684cfa2a6003b75f47f28f')

package() {
  cd ${srcdir}/otf-fira-mono-${pkgver}
  install -d ${pkgdir}/usr/share/fonts/OTF/
  install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
  install -D -m644 OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
