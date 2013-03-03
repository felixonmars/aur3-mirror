# Maintainer: Bolivar Stephen <bolivar.stephen@gmail.com>

pkgname=twmn
pkgver=20111205
pkgrel=1
pkgdesc="A notification system for tiling window managers"
arch=(any)
url="https://github.com/sboli/twmn"
license=('LGPL3')
groups=
provides=('twmnc' 'twmnd')
depends=('qt4>=4.6' 'boost-libs>=1.46' 'boost>=1.46' 'libxext')
makedepends=('git' 'pkg-config')
replaces=('twmn')
install=
source=()
_gitroot="git://github.com/sboli/twmn.git"
_gitname="twmn"

build() {
    msg "Downloading source code from git repository..."
    if [[ -d $_gitname ]] ; then
	cd $_gitname
	git pull
	msg "The local copy has been updated."
    else
	git clone $_gitroot || return 1
	msg "Source code successfully downloaded."
	cd $_gitname
    fi
    qmake-qt4
    make ${MAKEFLAGS:--j3}
    mkdir -p $pkgdir/usr/bin/
    cp bin/twmn* $pkgdir/usr/bin/
}
