# Maintainer: malex984 <malex984 at googlemail dot com>
# Contributor: sputnick <gilles DOT quenot AT gmail DOT com>

pkgname=sysrqd-git
pkgver=20110210
pkgrel=1

pkgdesc="A small daemon intended to manage Linux Sysrq over network."
arch=('i686' 'x86_64')
url="http://julien.danjou.info/sysrqd/"
license=('GPL')
install=('sysrqd.install')

makedepends=('git')
conflicts=('sysrqd')
provides=('sysrqd')

_gitroot="git://git.naquadah.org/sysrqd.git"
_gitname="sysrqd"

build() {
    cd ${srcdir}

    msg "Connecting to the git repository..."
    if [ -d ${srcdir}/${_gitname} ]; then
        cd ${_gitname}
        git pull origin
    else
        git clone --depth 1 ${_gitroot}
    fi
    msg "GIT checkout done or server timeout"

    rm -rf ${srcdir}/${_gitname}-build
    cp -r  ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
    cd ${srcdir}/${_gitname}-build

    msg "Starting make..."
    make || return 1
    make DESTDIR=${pkgdir} install || return 1
}
