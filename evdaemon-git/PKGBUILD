# Maintainer: Marc Cousin <cousinmarc@gmail.com>

pkgname=evdaemon-git
pkgver=20100423
pkgrel=1
pkgdesc="Monitor Linux event devices and modify their behavior"
arch=('i686' 'x86_64')
url='http://codegrove.org/evdaemon/'
license=('GPL')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://github.com/tuos/evdaemon.git"
_gitname="evdaemon"

build() {
	cd ${srcdir}
	msg "Connecting to GIT server...."

	if [ -d ${srcdir}/$_gitname ] ; then
	cd $_gitname && git pull origin
	msg "The local files are updated."
	else
	git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	git clone $_gitname $_gitname-build
	cd ${srcdir}/$_gitname-build
	#cd $_gitname-build
	autoreconf -f -i
	./configure --prefix=/ --bindir=/usr/bin || return 1
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
	
}
