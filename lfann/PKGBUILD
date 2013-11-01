# Maintainer: Lucas Hermann Negri <lucashnegri@gmail.com>

pkgname=lfann
pkgver=1.3.0
pkgrel=2
pkgdesc="FANN bindings to Lua" 
arch=(i686 x86_64)
url="http://oproj.tuxfamily.org" 
depends=('fann>=2.2' 'lua51') 
makedepends=('gcc')
license=(LGPL)
source=(https://bitbucket.org/lucashnegri/lfann/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('9f116db41395a04c7bf621bb102596c5')

build() {
    cd $srcdir/$pkgname-$pkgver
    make
}

package() { 
    cd $srcdir/$pkgname-$pkgver
    make install DESTDIR=$pkgdir/usr || 1
}
