# Contributor: Bernhard Friedreich <friesoft@gmail.com>

pkgname=meegotouch-theme-git
pkgver=20100814
pkgrel=1

pkgdesc=""
url="http://meego.gitorious.org/meegotouch/meegotouch-theme"
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt>=4.7')
makedepends=('git')

provides=( "meegotouch-theme-git=${pkgver}" "meegotouch-theme=${pkgver}" )
conflicts=( "meegotouch-theme" )

_gitroot="git://gitorious.org/meegotouch/meegotouch-theme.git"
_gitname="meegotouch-theme-git"

build() {
    # Export the include dir
    export QTDIR="/usr"
    export INCLUDE="/usr/include"

    msg "Connecting to the GIT server..."
    if [ -d ${_gitname}/.git ]; then
        cd ${_gitname}
        git pull
    else
        git clone ${_gitroot} ${_gitname}
        cd ${_gitname}
    fi

    qmake
    make || return 1

    make INSTALL_ROOT=$pkgdir install || return 1

    # Remove known zero-length files
    find ${pkgdir}/usr/share/themes -type f -size 0c -exec rm -f {} ';'
}
