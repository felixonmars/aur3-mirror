# -*- mode: sh; -*-
# Contributor: m039 <flam44 (at) gmail (dot) com>

pkgname=emacs-javadoc-help
_pkgname=javadochelp
pkgdesc="Javadoc-Help is an add-on module for Emacs that let you jump to a Javadoc page in the browser"
pkgver=1.0
pkgrel=1
arch=('any')
url="http://javadochelp.sourceforge.net/"
license=('GPL2')

_filename=javadoc-help.el
source=(https://downloads.sourceforge.net/project/$_pkgname/$_pkgname/$pkgver/$_filename)

install=$pkgname.install

build() {
    install -d $pkgdir/usr/share/emacs/site-lisp/
    install -m644 $srcdir/$_filename -t $pkgdir/usr/share/emacs/site-lisp/
}

md5sums=('6c90e5c0338a7cdd4073fae91294aba4')
