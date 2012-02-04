# Contributor: Ilya Mezhirov <mezhirov at iupr dot com>
# This is basically the same PKGBUILD as for ocroswig-hg.
pkgname=ocroswig
pkgver=0.4.4
pkgrel=1
pkgdesc="Python bindings for iulib and C++ part of OCRopus"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ocropus/"
license=('APACHE')
makedepends=('mercurial' 'swig')
depends=("ocropus=$pkgver" 'python-numpy')
source=('Makefile.patch' 'setup.py.patch')
md5sums=('992cb17a5e1b7e905e399b83128b727d'
         '064698dc82e2082f30851273fa8c6ccd')

build() {
    cd "$srcdir"
    msg "Connecting to Mercurial server...."

    if [ -d $pkgname ] ; then
        cd $pkgname
        hg pull -u -r ocropus-$pkgver || return 1
        msg "The local files are updated."
    else
        hg clone "https://ocroswig.ocropus.googlecode.com/hg/" \
            $pkgname -r ocropus-$pkgver || return 1
    fi

    msg "Mercurial checkout done or server timeout"

    rm -rf "$srcdir/$pkgname-build"
    cp -r "$srcdir/$pkgname" "$srcdir/$pkgname-build"
    cd "$srcdir/$pkgname-build"

    patch -Np1 -i "$srcdir/Makefile.patch" || return 1
    patch -Np1 -i "$srcdir/setup.py.patch" || return 1

    PREFIX="$pkgdir/usr" make
}
