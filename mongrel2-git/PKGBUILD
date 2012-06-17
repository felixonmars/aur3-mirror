# Maintainer: Mattias Wong <0x1998@gmail.com>
pkgname=mongrel2-git
pkgver=20120617
pkgrel=1
pkgdesc="Language agnostic web server for applications"
url="http://mongrel2.org"
license=("BSD")
arch=("i686" "x86_64")
depends=("sqlite3" "zeromq")
provides=("mongrel2=$pkgver")

_gitroot="https://github.com/zedshaw/mongrel2.git"
_gitname="mongrel2"

build() {
	cd $srcdir
	msg "Connecting to GIT server...."
	if [ -d $_gitname ]; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone --depth=1 -b develop $_gitroot
		cd $_gitname
	fi
	msg "GIT checkout done or server timeout"
	msg "Starting make..."
	cd ${srcdir}/${_gitname}
	make PREFIX="$pkgdir/usr" install
}
