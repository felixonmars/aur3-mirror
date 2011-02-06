# Contributor: Lyman Li <lymanrb@gmail.com>
pkgname=lenovo-sl-laptop
pkgver=20100628
pkgrel=1
pkgdesc="Experimental module to add support for hotkeys, screen brightness, and bluetooth rfkill for the Lenovo ThinkPad SL series with IdeaPad Firmware"
arch=('i686' 'x86_64')
url="http://github.com/tadzik/lenovo-sl-laptop"
license=('unkown')
depends=('kernel26')
makedepends=('git' 'kernel26-headers')
provides=('lenovo-sl-laptop')
install=${pkgname}.install
source=()
md5sums=()

_gitname="lenovo-sl-laptop"
_gitroot="git://github.com/tadzik/lenovo-sl-laptop.git"

build() {
	cd $srcdir
	msg "Connecting to GIT server..."
	if [[ -d $_gitname ]]; then
		(cd $_gitname && git pull origin)
	else
		git clone $_gitroot $_gitname
	fi
	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf $_gitname-build
	cp -r $_gitname $_gitname-build
	cd $_gitname-build

	make || return 1
	install -D -m 644 lenovo-sl-laptop.ko \
	$pkgdir/lib/modules/`uname -r`/kernel/drivers/lenovo-sl-laptop.ko
}
