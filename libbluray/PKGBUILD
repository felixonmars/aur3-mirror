# Maintainer: Andrew Cook <ariscop@gmail.com>

pkgname=libbluray
pkgver=20110915
pkgrel=1
pkgdesc="Blu-Ray access library"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.videolan.org/developers/libbluray.html"
depends=('openssl')
makedepends=('git' 'apache-ant' 'java-environment')
optdepends=('libaacs' 'libbdplus' 'java-runtime')
source=()
md5sums=()
provides=('libbluray')
conflicts=('libbluray')

_gitroot="git://git.videolan.org/libbluray.git"
_gitname="libbluray"

build() {
    msg "Connecting to GIT server..."

	if [ ! -d ${srcdir}/$_gitname ] ; then
	    git clone $_gitroot
	    cd ${srcdir}/libbluray    
	    git checkout -b new e8e400a
	fi

    cd ${srcdir}/libbluray
    
    msg "GIT checkout done or server timeout"
    
    msg "Starting build..."
	
    ./bootstrap
    ./configure --prefix=/ --with-jdk=$J2SDKDIR --enable-bdjava
    make || return 1
    make DESTDIR=${pkgdir}/usr install || return 1    
}
