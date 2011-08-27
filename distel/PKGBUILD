# Distel
# Contributor: J. Bromley <jbromley@gmail.com>
# $Id: PKGBUILD,v edc696a724f6 2008/07/09 04:20:33 jbromley $

pkgname='distel'
pkgver=3.3
pkgrel=1
pkgdesc="Distributed Emacs Lisp, or, an Emacs-based IDE for Erlang programming"
url="http://code.google.com/p/distel/"
# The following site seems to be down.
#url="http://www.bluetail.com/~luke/distel/"
license='Public Domain'
arch=('i686' 'x86_64')
depends=('emacs' 'erlang')
makedepends=('gzip')
conflicts=
provides=('distel')
install="$pkgname.install"
source=('http://downloads.sourceforge.net/distel/distel-3.3.tar.gz'
        'distel-build.el')
md5sums=('2a6672c078dcae15573e259296f8a031'
         '5fa42b4cfd6a3ac5d39670ea444c800a')

build() {
    cd $startdir/src/$pkgname-$pkgver

    ./configure --prefix=/usr --infodir=/usr/share/info
    make || return 1
    make info || return 1

    mkdir -p $startdir/pkg/usr/bin
    mkdir -p $startdir/pkg/usr/share/info

    cp doc/distel.info $startdir/pkg/usr/share/info/distel
    gzip $startdir/pkg/usr/share/info/distel
    make prefix=$startdir/pkg/usr install || return 1

    cd $startdir/pkg/usr/share/emacs/site-lisp/distel
    emacs -q --no-site-file -batch -l $startdir/distel-build.el \
        -f distel-byte-compile-distel
    # For some reason byte-compiling derl.el causes problems, delete it.
    rm $startdir/pkg/usr/share/emacs/site-lisp/distel/derl.elc
}

# Local variables:
# mode: shell-script
# End:
