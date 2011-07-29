# Contributor: Melancholy_Dream <Melancholy_Dream@write.su>
pkgname=aeneas
pkgver=1.2
pkgrel=2
pkgdesc="a 3D Monte Carlo Semiconductor Device Simulator"
arch=('i686')
url="http://www.gnu.org/software/aeneas/"
license=('GPL')
source=(http://ftp.gnu.org/gnu/aeneas/$pkgname-$pkgver.tar.gz)
md5sums=('268683f42732aca75d9ac21f23a144dc')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    ./configure --prefix=/usr
    make || return 1
    make DESTDIR="$pkgdir" install
}
