# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

_py=python2
_gitname=cmdtube

pkgname=$_gitname-git
pkgver=20121107
pkgrel=1
pkgdesc="Simple commandline youtube search and player"
arch=('any')
url="https://github.com/mikkeloscar/$_gitname.git"
license=('GPL')
depends=($_py 'youtube-dl' "$_py-gdata")
makedepends=($_py "$_py-distribute" 'git')
optdepends=('mplayer: default player')

_gitroot="git://github.com/mikkeloscar/$_gitname.git"

build() {
    cd $srcdir

    msg "Connecting to GIT server..."
    if [[ -d ${_gitname} ]]; then
        cd ${_gitname} && git pull origin
    else
        git clone ${_gitroot} ${_gitname}
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."

    rm -rf ${_gitname}-build
    cp -r ${_gitname} ${_gitname}-build

    cd ${srcdir}/${_gitname}-build

    $_py setup.py build || exit 1
    $_py setup.py install --root="${pkgdir}" --optimize=1

    rm -rf ${_gitname}-build
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm644 cmdtube.conf "$pkgdir/etc/xdg/cmdtube.conf"
}

# vim:set ts=2 sw=2 et:
