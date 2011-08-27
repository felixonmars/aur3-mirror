# Contributor: Nicolas Quienot <niQo>
pkgname=libopensync-plugin-google-calendar-old
pkgver=0.22
pkgrel=1
pkgdesc="Google Calendar plugin for OpenSync"
url="http://www.opensync.org/"
arch=('i686' 'x86_64')
makedepends=('cmake')
options=('!libtool')
depends=('libopensync' 'httplib2')
conflicts=('libopensync-plugin-gcalendar')
replaces=('libopensync-plugin-gcalendar')
license=('GPL')
source=(http://www.opensync.org/download/releases/$pkgver/libopensync-plugin-google-calendar-$pkgver.tar.bz2)
md5sums=('e97862bc7479e449206e2a438a159336')

build() 
{
	cd $startdir/src/libopensync-plugin-google-calendar-$pkgver
	mkdir build
	./configure
        make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}

