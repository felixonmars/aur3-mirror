# Maintainer Osetrov Alexander F. <osetrovaf@gmail.com>

pkgname=slim-theme-air
pkgver=1.0
pkgrel=3
pkgdesc="Air Theme for Slim Login Manager"
arch=('any')
license=('GPL')
depends=('slim')
url="http://kde-look.org/content/show.php/Simply+Glass+KDM?content=134415"
source=(https://www.dropbox.com/s/8om19c5vue5nfiq/slim-air-1.0.tar.gz?dl=1)
md5sums=('97cb5c6f80b84d84fb6a728d7181bc01')

package() {
  install -m755 -d ${pkgdir}/usr/share/slim/themes/slim-air
  install -m644 ${srcdir}/slim-air-${pkgver}/background.jpg ${pkgdir}/usr/share/slim/themes/slim-air
  install -m644 ${srcdir}/slim-air-${pkgver}/panel.png ${pkgdir}/usr/share/slim/themes/slim-air
  install -m644 ${srcdir}/slim-air-${pkgver}/background_credit.txt ${pkgdir}/usr/share/slim/themes/slim-air
  install -m644 ${srcdir}/slim-air-${pkgver}/panel.xcf ${pkgdir}/usr/share/slim/themes/slim-air
  install -m644 ${srcdir}/slim-air-${pkgver}/slim.theme ${pkgdir}/usr/share/slim/themes/slim-air
}
