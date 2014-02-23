# Maintainer: dvdkon <dvd dot kon at gmail dot com>
# Contributor: Arthur S. <eisensheng@gmail.com>

pkgname=basiliskii-git
pkgver=git
pkgrel=1
pkgdesc="A free, portable 68k Mac emulator with a JIT compiler"
arch=("any")
url="http://basilisk.cebix.net/"
license=("GPL2")
depends=("gtk2" "sdl")
makedepends=("git")
source=("git://github.com/cebix/macemu.git")
md5sums=("SKIP")
provides=("basiliskii")
conflicts=("basiliskii")

build()
{
	msg "Starting build"
	
	cd $srcdir/macemu/BasiliskII/src/Unix
	./autogen.sh
	./configure --prefix=/usr --enable-sdl-video --enable-sdl-audio --enable-jit-compiler
	make
}

package()
{
	cd $srcdir/macemu/BasiliskII/src/Unix
	make DESTDIR="$pkgdir" install
}

pkgver()
{
	cd "$srcdir/macemu/BasilliskII"
	git log --pretty=format:'%h' -n 1
}

