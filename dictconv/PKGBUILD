# Patched to work with gcc 4.3 - http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=486954
# Contributor: Francesco Namuri <francesco@namuri.it>
# Contributor: Jakob <dammawit@gmail.com>

pkgname=dictconv
pkgver=0.2
pkgrel=4
pkgdesc="Program to convert from a dictionary format to another"
url="http://ktranslator.sourceforge.net/"
license="GPL"
arch=('i686' 'x86_64')
depends=('libxml2')
source=(http://downloads.sourceforge.net/ktranslator/$pkgname-$pkgver.tar.bz2
http://patch-tracker.debian.org/patch/series/dl/dictconv/0.2-7/fixes-for-gcc-4.3.patch)
md5sums=('ceaf89a8d0f15cf48f77d0c553b6f895'
         'f60ff54947663cd31679c093f0a0eb45')


prepare() {
    cd $pkgname-$pkgver
    patch -p1 <$srcdir/fixes-for-gcc-4.3.patch
}

build() {
    cd $srcdir/$pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir install
}
