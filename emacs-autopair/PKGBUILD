# Contributor: m039 <flam44 (at) gmail (dot) com>

pkgname=emacs-autopair
_pkgname=autopair
pkgver=0.4
pkgrel=1
pkgdesc="Another stab at making braces and quotes pair like in TextMate"
url="http://code.google.com/p/autopair/"
arch=('any')
license=('GPL3')
depends=()
install=$pkgname.install
source=(http://autopair.googlecode.com/svn/trunk/$_pkgname.el)
md5sums=('42bd60abc73c39b00336ee24a22feb08')

build() {
  mkdir -p $startdir/pkg/usr/share/emacs/site-lisp
  cp $startdir/src/$_pkgname.el $startdir/pkg/usr/share/emacs/site-lisp
}
