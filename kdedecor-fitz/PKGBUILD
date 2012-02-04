# Contributor: fancris3 <fancris3 at aol.com>
pkgname=kdedecor-fitz
pkgver=0.4
pkgrel=1
pkgdesc="a window decoration for KDE that allows you to work (or play) faster."
arch=(i686 x86_64)
url="http://www.kde-look.org/content/show.php/Fitz?content=19455"
license=('GPL')
depends=('kdebase')
makedepends=('automake')
source=(http://switch.dl.sourceforge.net/sourceforge/fitz/fitz-0.4.tar.bz2)
md5sums=('d60b460b27603ce633630b50e581e989')

build() {
  cd fitz-${pkgver}
  ./configure --prefix=/opt/kde --with-qt-dir=/opt/qt
  make || return 1
  make DESTDIR=$startdir/pkg install
}
