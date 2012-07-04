# Originator: mitsuse <mitsuset at gmail>
# Maintainer: tychoish <sam at tychoish com>
pkgname=python2-hieroglyph-git
pkgver=20120704
pkgrel=1
pkgdesc="hieroglyph is an extension for Sphinx which builds HTML5 slides from ReStructured Text documents."
arch=("any")
url="http://yergler.net/projects/hieroglyph/"
license=("BSD")
groups=()
depends=("python2" "python2-sphinx")
makedepends=("python2-distribute" "git")
optdepends=()
provides=("python2-hieroglyph")
conflicts=("python2-hieroglyph" "python-hieroglyph-git" "python-hieroglyph" )
replaces=("python2-hieroglyph")
backup=()
options=()
install=
source=()
md5sums=()

_gitroot="git://github.com/nyergler/hieroglyph.git"
_gitname="hieroglyph"

build() {
    cd $srcdir
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    cd $srcdir/$_gitname
    python2 setup.py install --root="$pkgdir" --optimize=1
}
