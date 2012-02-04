pkgname=xmule
pkgver=1.13.7
pkgrel=1
pkgdesc="a wxwindow port of the edonkey client emule"
url="http://www.xmule.ws"
depends=(wxgtk)
conflicts=()
backup=()
install=
source=(http://www.xmule.ws/files/releases/$pkgname-$pkgver.tar.bz2)
md5sums=('9471fe57e534c39e02de52f20992969f')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --enable-optimise
  make || return 1
  make prefix=$startdir/pkg/usr install
} 