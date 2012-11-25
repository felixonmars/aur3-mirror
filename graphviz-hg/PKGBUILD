# Maintainer: Mauro Fruet <maurofruet@gmail.com>

pkgname=graphviz-hg
pkgver=9046
pkgrel=1
pkgdesc="Graph visualization software"
arch=('i686' 'x86_64')
url="http://www.graphviz.org/"
license=('custom:EPL')
depends=('libltdl' 'gd' 'librsvg' 'libxaw' 'ghostscript' 'pango' 'gts')
makedepends=('mercurial' 'swig' 'mono' 'guile' 'lua' 'ocaml' 'perl' 'php' 'python2' 'r' 'ruby' 'tk' 'qt')
optdepends=('mono: sharp bindings'
            'guile: guile bindings'
            'lua: lua bindings'
            'ocaml: ocaml bindings'
            'perl: perl bindings'
            'php: php bindings'
            'python2: python bindings'
            'r: r bindings'
            'ruby: ruby bindings'
            'tcl: tcl bindings'
            'qt: gvedit')
provides=('graphviz')
conflicts=('graphviz')
options=('!libtool')
install=graphviz.install
source=()

_hgroot="http://hg.research.att.com"
_hgrepo="graphviz"

build() {
    msg "enter build"
    cd "$srcdir"
    msg "Connecting to Mercurial server...."

    if [[ -d "$_hgrepo" ]]; then
        cd "$_hgrepo"
        hg pull -u
        msg "The local files are updated."
    else
        hg clone "$_hgroot"
    fi

    msg "Mercurial checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$srcdir/$_hgrepo-build"
    cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
    cd "$srcdir/$_hgrepo-build"

    export PYTHON=python2

    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_hgrepo-build"
    make DESTDIR="$pkgdir/" install
}
