# Contributor: Tocer Deng <tocer.deng@gmail.com>

pkgname=libaterm
_pkgname=aterm
pkgver=2.5
pkgrel=1
pkgdesc="a high performance implementation of ATerm datatype using maximal sharing and automatic garbage collection."
arch=('i686')
url="http://strategoxt.org/"
license=('LGPL')
depends=()
makedepends=()
source=(ftp://ftp.stratego-language.org/pub/stratego/StrategoXT/strategoxt-0.17/$_pkgname-$pkgver.tar.gz
        https://svn.nixos.org/repos/nix/nixpkgs/trunk/pkgs/development/libraries/aterm/max-long.patch)
md5sums=('33ddcb1a229baf406ad1f603eb1d5995'
         '0c7e50b3686a079959e7c978af9444db')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  patch -p1 < ../max-long.patch

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
