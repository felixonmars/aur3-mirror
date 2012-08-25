pkgname=usagi
pkgver=1
pkgrel=2
pkgdesc="A set of zsh utility functions."
arch=('i686' 'x86_64')
url="http://github.com/nuisanceofcats/usagi"
license=('MIT')
depends=('zsh')
makedepends=('make')
provides=(usagi)
source=(https://downloads.sourceforge.net/project/usagi/usagi-1.tar.gz)
md5sums=('97c52cc615466d6584946bb82752ea0e')

build() {
    :
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make install DESTDIR=$pkgdir
}
