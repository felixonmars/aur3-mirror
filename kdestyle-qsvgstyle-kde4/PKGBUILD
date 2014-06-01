# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: 

pkgname=kdestyle-qsvgstyle-kde4
_pkgname=QSvgStyle
pkgver=1
pkgrel=1
pkgdesc="An SVG themeable style for Qt4 applications."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/QSvgStyle?content=165505"
license=("GPL")
depends=('qt4')
makedepends=()
conflicts=()
source=(http://saidlankri.free.fr/${_pkgname}.tar.gz)
sha256sums=('6a2d4b077755a63f12f790318710907c207fb1f5fa47e42b6eb065797517086d')

build() {
  cd "${srcdir}/${_pkgname}"
  
  qmake-qt4
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  
  install -dm 755 "$pkgdir"/usr/{bin,lib/qt4/plugins/styles}
  
  install -m 755 style/plugins/libqsvgstyle.so "$pkgdir"/usr/lib/qt4/plugins/styles/
  install -m 755 themebuilder/bin/qsvgthemebuilder "$pkgdir"/usr/bin/
}
