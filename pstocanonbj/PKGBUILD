pkgname=pstocanonbj
pkgver=3.3
pkgrel=1
pkgdesc="Filter called by CUPS to exec bjfilter"
arch=(i686)
url="http://mambo.kuhp.kyoto-u.ac.jp/~takushi/"
license=('GPL')
depends=('libcups')
source=(http://mambo.kuhp.kyoto-u.ac.jp/~takushi/debian/pstocanonbj_3.3.orig.tar.gz)
noextract=()
md5sums=(c8f0e0745b80425e311a990085fec810)

build() {
  cd $srcdir/$pkgname-$pkgver/
  ./configure --prefix=/usr
  make
}

package() { 
  cd $srcdir/$pkgname-$pkgver/
  make DESTDIR="$pkgdir/" install
}
