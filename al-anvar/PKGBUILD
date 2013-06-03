# Maintainer: Atilla ÖNTAŞ <tarakbumba@gmail.com>
# Contributor: neo14515  <neo14515@gmail.com>

pkgname=al-anvar
pkgver=0.5.0
pkgrel=3
pkgdesc="open source freeware software for study Quran ( koran ) and research "
arch=('i686' 'x86_64')
url="http://al-anvar.sourceforge.net/"
license=('GPL')
depends=('qt4' 'phonon')
makedepends=('qt4' 'phonon')
options=('!strip')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/src-${pkgname}-${pkgver}.tar.gz")
md5sums=('b29408a8fee7ae31ca8a7efe2775f1a4')

build() {
  tar xf src-${pkgname}-${pkgver}.tar.gz
  cd src-${pkgname}-${pkgver}
  qmake-qt4
  make
}

package() {
  cd src-${pkgname}-${pkgver}

  make INSTALL_ROOT=${pkgdir} install
}

