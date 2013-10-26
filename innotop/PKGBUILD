# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Nassim Kacha <nassim.kacha@gmail.com>

pkgname=innotop
pkgver=1.9.1
pkgrel=1
pkgdesc="A top clone for MySQL with more features and flexibility than similar tools"
arch=('i686' 'x86_64')
url="http://innotop.googlecode.com"
license=('GPL2')
depends=('perl-dbd-mysql' 'perl-term-readkey')
source=(http://innotop.googlecode.com/files/$pkgname-$pkgver.tar.gz)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    perl Makefile.PL
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" INSTALLSITESCRIPT=/usr/bin
    rm -rf "$pkgdir/usr/lib"
}

sha256sums=('117e5af58a83af79b6cf99877b25b1479197597be5a7d51b245a0ad9c69f4d3d')
