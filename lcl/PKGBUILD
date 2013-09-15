# Maintainer: Lucas Hermann Negri <lucashnegri@gmail.com>

pkgname=lcl
pkgver=1.1.0
pkgrel=1
pkgdesc="l10n and i18n utilities for Lua" 
arch=(i686 x86_64)
url="http://oproj.tuxfamily.org" 
depends=('lua>=5.1' 'gettext') 
makedepends=('gcc')
license=(LGPL)
source=(https://bitbucket.org/lucashnegri/$pkgname/downloads/$pkgname-$pkgver.tar.gz)
md5sums=("6581e2ef10fc5d2988ee1c586072b0b7")

build() { 
    cd $srcdir/$pkgname-$pkgver
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver    
    make install DESTDIR=$pkgdir/usr || 1
}
