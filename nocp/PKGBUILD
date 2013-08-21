# Maintainer: Alexej Magura <agm2819*gmail*>
# 
# 
pkgname=nocp
pkgver=2.0.2
pkgrel=2
pkgdesc="a safe way to copy files"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/noclobbercopy"
license=('GPL3')
depends=('glibc' 'chicken')
options=('!buildflags')
source=("http://sourceforge.net/projects/noclobbercopy/files/$pkgver/$pkgname-${pkgver}.tar.gz/download")
md5sums=('10d3714ed27c819ac49f1a3649310e0d')

build () {

    cd "$srcdir/$pkgname-$pkgver/src"

    make

    cd "$srcdir/$pkgname-$pkgver/docs"

    rake

}

package () {

    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="\"$pkgdir\"" install



}
