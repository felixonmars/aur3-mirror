# Contributor: julien <paci79@free.fr>
pkgname=grunka
pkgver=0.0.2
pkgrel=1
pkgdesc="grunka is a wavelan signal strength monitoring applet suitable for inclusion in the screen  hardstatus line"
arch=('i686' 'x86_64')
license="GPL"

url="http://www.wormulon.net/projects/grunka"
source="http://www.wormulon.net/files/code/grunka/$pkgname-$pkgver.tar.gz"

makedepends=()
depends=('screen' 'psmisc')
md5sums=('360d7d127e268112f3860a561788ecb7')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	install -d $startdir/pkg/usr/bin/
	install $startdir/src/$pkgname-$pkgver/grunka $startdir/pkg/usr/bin/grunka
	
}
