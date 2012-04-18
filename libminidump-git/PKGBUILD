# Maintainer: Tom Debruyne <tomdebruyne at gmail dot com>
pkgname=libminidump-git
pkgver=20120418
pkgrel=1
pkgdesc="A Minidump and Minicore Generator Library"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
url=('http://cgit.freedesktop.org/libminidump')
optdepends=()
makedepends=('git' 'make' 'gcc' 'libtool' 'autoconf')
provides=('libminidump')
conflicts=('libminidump')

_gitroot="git://anongit.freedesktop.org/libminidump"
_gitname="libminidump"

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

        rm -rf $srcdir/$_gitname-build
        git clone $srcdir/$_gitname $srcdir/$_gitname-build
  
        cd $srcdir/$_gitname-build
	
	./autogen.sh
        ./configure CFLAGS='-g -O0' --prefix=/usr 
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
	
}



