# Maintainer: Colin Pitrat <colin.pitrat@gmail.com>
# Contributor: 
# $Id $
pkgname=spamoracle
pkgver=1.4
pkgrel=1
pkgdesc="a tool to help detect and filter away spam"
url="http://pauillac.inria.fr/~xleroy/software.html"
license=('GPL')
groups=
provides=(spamoracle)
depends=()
makedepends=(ocaml)
conflicts=()
replaces=()
backup=()
install=()
source=(http://pauillac.inria.fr/~xleroy/software/$pkgname-$pkgver.tar.gz)
md5sums=('9cd2a825202c86a3728658545b0ac060')
arch=('i686')

build()
{
    cd $startdir/src/$pkgname-$pkgver
    sed -i "s?BINDIR=.*?BINDIR=$startdir/pkg/usr/bin?" Makefile
    sed -i "s?MANDIR=.*?MANDIR=$startdir/pkg/usr/man?" Makefile
    mkdir -p $startdir/pkg/usr/bin
    mkdir -p $startdir/pkg/usr/man/man1
    mkdir -p $startdir/pkg/usr/man/man5
    make || return 1
    make install
}
