# Contributor: fancris3 <fancris3 at aol.com>
pkgname=kdedecor-cellophane
pkgver=1.41
pkgrel=4
pkgdesc="SVG based KDE window decoration.A thin layer of plastik to keep things fresh"
arch=(i686 x86_64)
url="http://www.digilanti.org/cellophane/"
license=('GPL')
depends=('kdebase')
makedepends=('automake')
source=(http://www.archpkg.rodp.net/src/Cellophane-$pkgver.tar.bz2)
md5sums=('58cac1ebb959ab0a94601c570a517344')

build() {
  cd Cellophane-${pkgver}
  aclocal
  make -f Makefile.cvs
  ./configure --prefix=/opt/kde --with-qt-dir=/opt/qt
  make || return 1
  make DESTDIR=$startdir/pkg install
}
