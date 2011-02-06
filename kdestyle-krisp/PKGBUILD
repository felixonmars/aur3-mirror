pkgname=kdestyle-krisp
pkgver=0.1
pkgrel=1
pkgdesc="A simple and vibrant KDE 3.4.x Style"
url="http://www.kde-look.org/content/show.php?content=18378"
license="GPL"
depends=('kdebase')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.kde-look.org/content/files/18378-krisp-$pkgver.tar.bz2)
md5sums=('e0b01d0772574be0cb089bb3e712ea9c')

build() {
  cd $startdir/src/krisp-$pkgver
  ./configure --disable-debug --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}					
