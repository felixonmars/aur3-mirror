# Contributor: nQo
pkgname=libopensync-plugin-kdepim
pkgver=0.36
pkgrel=1
pkgdesc="KDE-Pim plugin for OpenSync"
url="http://www.opensync.org/"
arch=('i686' 'x86_64')
makedepends=('cmake')
options=('!libtool')
depends=('libopensync' 'kdepim')
license=('GPL')
source=(http://www.opensync.org/download/releases/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('4fc80504fc76fbd0bb04d61f5a1b8a6d')

build() 
{
	cd $startdir/src/$pkgname-$pkgver
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../

        make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}

