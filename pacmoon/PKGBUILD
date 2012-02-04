pkgname=pacmoon
pkgver=0.8.3
pkgrel=1
pkgdesc="A tool to recompile binary installed arch packages from source."
arch=('i686' 'x86_64')
url="http://chilon.net/pacmoon"
license=('MIT')
depends=('usagi')
makedepends=('make')
provides=(pacmoon)
source=(https://downloads.sourceforge.net/project/pacmoon/pacmoon-$pkgver.tar.gz)
md5sums=('ed7e519c47f83818b8363b520e8ae524')

build() {
    :
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make install DESTDIR=$pkgdir
}
