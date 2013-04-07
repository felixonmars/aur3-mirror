# Maintainer: Dominik Heidler <dheidler@gmail.com>
pkgname=rcswitch-pi
pkgver=20130407
pkgrel=1
pkgdesc="Control remote power sockets using the raspberry pi"
arch=('x86_64' 'i686' 'armv6h')
license=('GPL')
depends=('wiringpi')
makedepends=('git' 'gcc')
optdepends=()
url="https://github.com/r10r/rcswitch-pi"
source=()
md5sums=()

_gitroot=git://github.com/r10r/rcswitch-pi.git
_gitname=rcswitch-pi

build() {
	cd ${srcdir}
	if [ -d $_gitname ]; then
		cd $_gitname && git reset HEAD --hard && git clean -x -d -f && git pull origin
		msg "Updated the local files."
	else
		git clone $_gitroot
		msg "GIT checkout done or server timeout"
		cd $_gitname
	fi
	msg "Starting build."
	make
}

package() {
	cd $srcdir/$_gitname/
	mkdir -p $pkgdir/usr/bin
	install -m755 send $pkgdir/usr/bin/rcswitch-pi
}
