pkgname=gf2x
pkgver=1.1
pkgrel=1
pkgdesc="A library for multiplying polynomials over the binary field"
arch=('i686' 'x86_64')
url="http://gforge.inria.fr/projects/gf2x/"
license=('GPL' 'LGPL')
depends=('glibc')
options=('!libtool')
source=("http://gforge.inria.fr/frs/download.php/30873/gf2x-1.1.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  opts=""
  if ! (fgrep -qw sse2 /proc/cpuinfo) ; then opts="--disable-sse2" ; fi
  ./configure --prefix=/usr $opts
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}

sha256sums=('0d3f01604680102a00ca34e079903cc4d5a3208afda223748979b724d358849f')
