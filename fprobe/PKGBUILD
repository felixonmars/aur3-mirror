pkgname=fprobe
pkgver=1.1
pkgrel=1
pkgdesc="collect network traffic data and emit it as NetFlow flows towards the specified collector"
arch=(i686 x86_64)
url="http://fprobe.sourceforge.net/"
license=('GPL')
depends=()
makedepends=()
optdepends=(flow-tools)
backup=()
options=()
source=(http://dfn.dl.sourceforge.net/sourceforge/fprobe/fprobe-$pkgver.tar.bz2)
md5sums=('65850d0470078269b33eee58cba77ac2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
  make DESTDIR="$pkgdir/" install
}
