# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  perlawk
pkgname=plaiba 
_pkgname=c-distr 
pkgver=1.0
pkgrel=2 
pkgdesc="The Programming Language : An interpreter-based Approach, source code, translated from Pascal to C by the author using p2c and modifiy for linux by perlawk. An excellent demonstration for learning creating programming language from scratch."
url="http://loome.cs.uiuc.edu/kamin/pubs.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('p2c')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(${_pkgname}.sh)
md5sums=('6057d5233f22c209c9b02f331a1c1bda')
build() {
  cd $startdir/src/
  sh ./${_pkgname}.sh
  cd $startdir/src/$_pkgname
  make || return 1
  mkdir -p $pkgdir/usr/share/plaiba
  cp apl chap1 clu lisp prolog sasl scheme smalltalk $pkgdir/usr/share/plaiba
  cp code* $pkgdir/usr/share/plaiba
}
