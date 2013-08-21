# -*- mode: sh; -*-
# Contributor: m039 <flam44 (at) gmail (dot) com>

pkgname=emacs-sr-speedbar
_pkgname=sr-speedbar
pkgver=0.1.8
pkgrel=1
pkgdesc="Same frame speedbar for Emacs"
url="http://www.emacswiki.org/cgi-bin/emacs/SrSpeedbar"
arch=('any')
license=('GPL3')
depends=()
install=$pkgname.install
source=(http://www.emacswiki.org/emacs/download/$_pkgname.el)

build() {
  mkdir -p $pkgdir/usr/share/emacs/site-lisp
  cp $startdir/src/$_pkgname.el $pkgdir/usr/share/emacs/site-lisp
}

md5sums=('47311307640ebca1ca9706ca9c71e807')
