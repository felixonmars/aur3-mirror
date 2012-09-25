# Maintainer: cF8 <cf8@cf8.ru>

pkgname=tim-git
pkgver=20120925
pkgrel=1
pkgdesc="Terminal countdown timer with several modes written in Zsh shell script."
arch=(any)
url="http://github.com/ggustafsson/Tim"
license=('BSD')
depends=('zsh')
makedepends=('git')
conflicts=('tim')
provides=('tim')
replaces=()
backup=()
source=()
md5sums=()

_gitroot="git://github.com/ggustafsson/Tim.git"
_gitname="Tim"

build() {
    cd ${srcdir}
    msg "Connecting to github.com GIT server...."

    if [ -d ${srcdir}/$_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting script install..."

    git clone ${srcdir}/$_gitname ${srcdir}/$_gitname-build
    cd ${srcdir}/$_gitname-build

    install -Dm755 tim ${pkgdir}/usr/bin/tim
    install -Dm644 timrc.example ${pkgdir}/etc/xdg/tim/timrc.example
}
# vim:set ts=4 sw=4 et:
