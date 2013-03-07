# Maintainer: Andrew Cook <ariscop@gmail.com>

pkgname=strace-plus
pkgver=20130307
pkgrel=1
pkgdesc="Strace extended to include stack traces"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://code.google.com/p/strace-plus/"
depends=()
makedepends=('git')
optdepends=('python2')
source=()
md5sums=()

_gitroot="https://code.google.com/p/strace-plus/"
_gitname="strace-plus"

build() {
    msg "Connecting to GIT server..."

    if [ -d ${srcdir}/$_gitname ] ; then
        cd $_gitname && git pull origin
    else
        git clone $_gitroot
    fi
    
    msg "GIT checkout done or server timeout"
    msg "Starting build..."
	
    cd ${srcdir}/${_gitname}
    ./configure --prefix=/usr
    ( make || make ) || return 1
    make DESTDIR=${pkgdir} install || return 1

    #resolve conflicts with normal strace
    mv ${pkgdir}/usr/share/man/man1/strace.1 \
        ${pkgdir}/usr/share/man/man1/strace+.1

    mv ${pkgdir}/usr/bin/strace-graph \
        ${pkgdir}/usr/bin/strace+-graph

}
