# Maintainer: Jan Houben jan@next-game.de

pkgname=pidvbip-git
_gitname='pidvbip'
pkgver=295+g65b9d7a
pkgrel=1
pkgdesc="DVB-over-IP set-top box software for the Raspberry Pi"
arch=('armv6h')
url="https://github.com/eindano/pidvbip/"
license=('GPL2')
depends=('avahi' 'mpg123' 'faad2' 'a52dec' 'freetype2')
makedepends=('git')
provides=('pidvbip')
conflicts=('pidvbip')
	
source=("git+https://github.com/eindano/pidvbip.git")
md5sums=('SKIP')
	
pkgver() {
	cd ${_gitname}
	echo $(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)
}
	
build() {
	cd ${_gitname}
	./configure --prefix=/usr
	make
}
	
package() {
	cd ${_gitname}
	install -D -m 755 "pidvbip" "$pkgdir/usr/bin/pidvbip"
}
	
