# Contributor: BinkyTheClown <binky_at_archlinux_dot_us>
pkgname=gecodej
pkgver=2.2.0
pkgrel=5
pkgdesc="A Java interface for the Gecode C++ constraint programming library."
arch=(i686 x86_64)
url="http://www.gecode.org/gecodej/"
license=('BSD')
makedepends=('gcc' 'pkgconfig' 'diffutils' 'make' 'perl' 'apache-ant')
depends=('gecode=2.2.0' 'jdk')
source=(http://www.gecode.org/download/$pkgname-$pkgver.tar.gz)
md5sums=('abd96048201805e014bfbce108ecf567')

build() {
    cd $srcdir/$pkgname-$pkgver
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$pkgdir install
    install -m 644 -D LICENSE $pkgdir/usr/share/licenses/gecodej/LICENSE
}
