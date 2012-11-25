# Maintainer: Mao Jianjun <justmao945@gmail.com>

pkgname=mplayer-vdpau-shell-git
pkgver=20121107
pkgrel=1
pkgdesc="Provides a simple wrapper for better calling mplayer with VDPAU support."
arch=('i686' 'x86_64')
url="https://github.com/justmao945/mplayer-vdpau-shell"
license=('ISC')
optdepends=('mplayer' 'libvdpau: Nvidia VDPAU library')
makedepends=('git' 'cmake')

_gitroot="git://github.com/justmao945/mplayer-vdpau-shell.git"
_gitname="mplayer-vdpau-shell"

build() {
    msg "Connecting to GIT server"

    if [ -d ${srcdir}/$_gitname ] ; then
        cd ${srcdir}/$_gitname && git pull origin || return 1
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname || return 1
    fi

    msg "GIT checkout done or server timeout"

    cd "${srcdir}/${_gitname}" || return 1

    if [ -d ${srcdir}/build ]
    then
        cd ${srcdir}/build
    else
        mkdir ${srcdir}/build
        cd ${srcdir}/build
    fi
    
    # FIXME You should place your own compiler here...
    gcc ${srcdir}/${_gitname}/main.c -o ${srcdir}/build/mplayer
    install -Dm755 ${srcdir}/build/mplayer ${pkgdir}/usr/local/bin/mplayer || return 1
}


