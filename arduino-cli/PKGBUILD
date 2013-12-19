# Contributor : Devaev Maxim <mdevaev@gmail.com>

pkgname=arduino-cli
pkgver=0.1
pkgrel=1
pkgdesc="CLI development tools for Arduino without Java and Arduino IDE"
arch=('any')
url="http://code.google.com/p/arduino-cli"
license="GPL"
depends=('avr-libc' 'gcc-avr' 'binutils-avr' 'avrdude' 'python2')
makedepends=('git')

_gitroot="git://github.com/mdevaev/arduino-cli.git"
_gitname="arduino-cli"


build() {
	cd $startdir/src
	if [ -d $_gitname ]; then
		msg "Updateing local repository..."
		cd $_gitname
		git pull origin master || return 1
		msg "The local files are updated."
		cd ..
	else
		git clone --branch=v$pkgver --depth=1 $_gitroot
	fi

	msg "Git clone done or server timeout"
	msg "Starting make..."

	rm -rf $_gitname-build
	cp -r $_gitname $_gitname-build
	cd $_gitname-build

	make DESTDIR=$pkgdir install
}

