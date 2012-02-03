# Maintainer: Spencer Judd <spencercjudd@gmail.com>

pkgname=paest-cli-git
pkgver=20120203
pkgrel=1
pkgdesc="A command-line interface for pae.st, the pastebin for hardcore programmers."
arch=('any')
url="https://github.com/scjudd/paestcli"
license=('GPL')
depends=('python2')
makedepends=('git')
provides=('paest-cli')

_gitroot="git://github.com/scjudd/paestcli.git"
_gitname="paestcli"

build() {
    cd ${srcdir}
    msg "Connecting to GIT server...."

    if [ -d ${_gitname} ]; then
        cd ${_gitname} && git pull origin
        msg "The local files are updated."
    else
        git clone ${_gitroot}
    fi

    msg "GIT checkout done or server timeout."
}

package() {
    install -D -m755 ${srcdir}/${_gitname}/paest ${pkgdir}/usr/bin/paest
}

