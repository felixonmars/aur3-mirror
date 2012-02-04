# Maintainer: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Wieland Hoffmann <the_mineo@web.de>
# Contributor: stonecrest <stonecrest[at]gmail[dot]com>

pkgname=python-mpd-git
pkgver=20111223
pkgrel=1
pkgdesc="Python MPD client library"
url="http://pypi.python.org/pypi/python-mpd/"
depends=('python2')
makedepends=('git')
license=('GPL3')
arch=('any')
conflicts=('python-mpd')
provides=('python-mpd')
source=()
md5sums=()

_gitroot="git://jatreuman.indefero.net/jatreuman/python-mpd.git"
# Original git repo:
#_gitroot="http://git.thejat.be/python-mpd.git"
_gitname="python-mpd"

build() {
    cd $srcdir

    msg "Connecting to GIT server..."

    if [ -d $srcdir/$_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    cd $srcdir/$_gitname
    python2 setup.py install --root="$pkgdir" --optimize=1
}

