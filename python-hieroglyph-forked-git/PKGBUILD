# Maintainer: mitsuse <mitsuset at gmail>
pkgname=python-hieroglyph-forked-git
pkgver=20120507
pkgrel=1
pkgdesc="hieroglyph is an extension for Sphinx which builds HTML5 slides from ReStructured Text documents. (Fork, Testing)"
arch=(any)
url="git://github.com/mitsuse/hieroglyph.git"
license=("BSD")
groups=()
depends=(
    "python" "python-sphinx")
makedepends=("python-distribute" "git")
optdepends=()
provides=("python-hieroglyph")
conflicts=("python-hieroglyph" "python-hieroglyph-git")
replaces=("python-hieroglyph")
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()

_gitroot="git://github.com/mitsuse/hieroglyph.git"
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
    python setup.py install --root="$pkgdir" --prefix=/usr
}
