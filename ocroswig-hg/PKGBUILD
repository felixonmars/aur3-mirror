# Contributor: Ilya Mezhirov <mezhirov at iupr dot com>
pkgname=ocroswig-hg
pkgver=180
pkgrel=1
pkgdesc="Python bindings for iulib and C++ part of OCRopus"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ocropus/"
license=('APACHE')
makedepends=('mercurial' 'swig')
depends=('ocropus-hg' 'python-numpy')
source=(Makefile.patch)
md5sums=('992cb17a5e1b7e905e399b83128b727d')

_hgroot="https://ocroswig.ocropus.googlecode.com/hg/"
_hgrepo="ocroswig"

build() {
    cd "$srcdir"
    msg "Connecting to Mercurial server...."

    if [ -d $_hgrepo ] ; then
        cd $_hgrepo
        hg pull -u || return 1
        msg "The local files are updated."
    else
        hg clone $_hgroot $_hgrepo || return 1
    fi

    msg "Mercurial checkout done or server timeout"

    rm -rf "$srcdir/$_hgrepo-build"
    cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
    cd "$srcdir/$_hgrepo-build"

    patch -Np1 -i "$srcdir/Makefile.patch" || return 1

    PREFIX="$pkgdir/usr" make
}
