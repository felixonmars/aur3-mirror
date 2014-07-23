# Maintainer: Markus Weimar <mail at markusweimar dot de>
pkgname=ttf-fira-mono
epoch=1
pkgver=3.111
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="A monospace typeface designed for Firefox OS."
arch=('any')
url="https://www.mozilla.org/en-US/styleguide/products/firefox-os/typeface/"
license=('custom:OFL')
source=("http://www.markusweimar.de/public/ttf-fira-mono-3.111.tar.xz")
install=${pkgname}.install
md5sums=('f2f24e5afb693cf740e5cdd3ea7a4aeb')

package() {
  cd ${srcdir}/ttf-fira-mono-${pkgver}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
