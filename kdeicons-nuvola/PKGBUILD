# Contributor: Thomas Karmann <thomas@karmann-paf.de>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=kdeicons-nuvola
pkgver=1.0
pkgrel=4
pkgdesc="Professional-looking and consistent icon theme for KDE"
arch=(i686 x86_64)
url="http://www.kde-look.org/content/show.php?content=5358"
license="LGPL"
source=(http://www.icon-king.com/files/nuvola-${pkgver}.tar.gz)
md5sums=('bf3e477716fe0b39de81c210d1b5a8d1')

build() {
  cd ${startdir}/src/
  mkdir -p ${startdir}/pkg/opt/kde/share/icons/
  mv nuvola ${startdir}/pkg/opt/kde/share/icons/
}
