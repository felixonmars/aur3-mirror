# Contributor: Nicolas Quienot <niQo>
pkgname=libopensync-plugin-google-calendar
pkgver=0.38
pkgrel=1
pkgdesc="Google Calendar plugin for OpenSync"
url="http://www.opensync.org/"
arch=('i686' 'x86_64')
makedepends=('cmake')
options=('!libtool')
depends=('libopensync-unstable' 'libgcal')
conflicts=('libopensync-plugin-gcalendar')
replaces=('libopensync-plugin-gcalendar')
license=('GPL')
source=(http://www.opensync.org/download/releases/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('1ab2ddd3953fee3dfa6d6f7f43c60b36')

build() 
{
	cd $startdir/src/$pkgname-$pkgver
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../
        make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}

