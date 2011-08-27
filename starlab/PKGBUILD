#Contributor: karnath <karnathtorjian@gmail.com>

pkgname=starlab
pkgver=4.4.4
pkgrel=2
pkgdesc="Software for simulating the evolution of n-body problem (dense stellar systems) and analyzing the resultant data"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('qt3')
makedepends=('gcc-fortran')
url="http://www.sns.ias.edu/~starlab/index.html"
install=starlab.install
source=("http://www.sns.ias.edu/~starlab/download/starlab-$pkgver.tar.gz")
md5sums=('1143741aee7d57988c6db715c9fa05da')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/opt/starlab
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir install

}

