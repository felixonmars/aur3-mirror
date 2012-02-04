# Maintainer Osetrov Alexander F. <osetrovaf@gmail.com>

pkgname=slim-simply-glass
pkgver=1.0
pkgrel=1
pkgdesc="Simply Glass Theme for Slim Login Manager"
arch=('any')
license=('GPL')
depends=('slim')
url="http://kde-look.org/content/show.php/Simply+Glass+KDM?content=134415"
source=("slim-simply-glass.tar.bz2")
md5sums=('c96f54ef7f86a07be530098296d8d66e')

build() {
  install -m755 -d ${pkgdir}/usr/share/slim/themes/simply_glass
  install -m644 ${srcdir}/simply_glass/background.png ${pkgdir}/usr/share/slim/themes/simply_glass/
  install -m644 ${srcdir}/simply_glass/panel.png ${pkgdir}/usr/share/slim/themes/simply_glass/
  install -m644 ${srcdir}/simply_glass/slim.theme ${pkgdir}/usr/share/slim/themes/simply_glass/
}
