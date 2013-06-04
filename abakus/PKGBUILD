# Maintainer: darkapex <me@jailuthra.in>
# Contributor: sevenfourk <sevenfourk@gmail.com>

pkgname=abakus
pkgver=0.92
pkgrel=2
pkgdesc="Abakus is a simple calculator for KDE. Think of it as bc (the command-line calculator) with a nice GUI." 
url="http://purinchu.net/abakus/" 
depends=('kdebase-runtime' 'qt4')
makedepends=('cmake' 'automoc4' 'flex' 'bison')
conflicts=('abakus-git')
source=(http://purinchu.net/abakus/$pkgname-$pkgver.tar.bz2) 
arch=('i686' 'x86_64')
license='GPL2' 
md5sums=('75df65492b468555b328b834e87f8957')

build() { 
     cd "$srcdir/$pkgname-$pkgver"
     cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
     make
}

package() {
        make -C "$srcdir/$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

