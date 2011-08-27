# -*- mode: sh; -*-
# Contributor: m039 <flam44 (at) gmail (dot) com>

pkgname=emacs-etags-select
_pkgname=etags-select
pkgdesc="Functions that select a tag from multiple tags"
pkgver=1.13
pkgrel=1
url="http://www.emacswiki.org/emacs/EtagsSelect"
arch=('any')
license=('GPL2')
depends=()
install=$pkgname.install
source=(http://www.emacswiki.org/emacs/download/$_pkgname.el)

build() {
  mkdir -p $startdir/pkg/usr/share/emacs/site-lisp
  cp $startdir/src/$_pkgname.el $startdir/pkg/usr/share/emacs/site-lisp
}

md5sums=('9e1d16ee0a12cc7c9396153d5193960c')
