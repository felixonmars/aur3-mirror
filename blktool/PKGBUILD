pkgname=blktool
pkgver=4
pkgrel=1
pkgdesc="A hdparm reimplementation for IDE and SCSI drives"
url="http://sourceforge.net/projects/gkernel/"
license="GPL"
depends=(glib2)
makedepends=(make gcc)
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(http://dl.sourceforge.net/sourceforge/gkernel/$pkgname-$pkgver.tar.gz)
md5sums=('9272a47c6254b506548ba10a2a9f8bb3')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
