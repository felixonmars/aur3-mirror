#!/bin/bash
### The above line is just there for automatic syntax highlighting in editors.

# Maintainer: Dreieck.
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Modified: 2013-06-21 vor Version 3.0.5.
# Created: 18/03/2011
pkgname=autopanopro
_pkgname=AutopanoPro
pkgver=3.0.5
pkgrel=2
pkgdesc='The program for creating panoramic images.'
arch=('i686' 'x86_64')
url='http://kolor.com/'
license=('custom: "commercial"')
depends=("qt4>=4" "mesa")
install=autopanopro.install
case $CARCH in
  i686)
  source=("AutopanoPro_Linux32.tar.gz::http://download.kolor.com/app/stable/linux32tar"
  "$pkgname" "$pkgname.desktop")
  md5sums=('a5d315ff7aa38df97b5a4be5cafcd603'
         'af92ded056fe76463e51cef59b303ac5'
         'abf0e0ddcc4071534378c4b69a559c51')
  ;;
  x86_64)
    source=("AutopanoPro_Linux64.tar.gz::http://download.kolor.com/app/stable/linux64tar"
    "$pkgname" "$pkgname.desktop")
    md5sums=('43c5da0bf0af284959550747613abea9'
         'af92ded056fe76463e51cef59b303ac5'
         'abf0e0ddcc4071534378c4b69a559c51')
  ;;
esac
package(){
  cd "$srcdir/$_pkgname" || return 1
  install -dm755 $pkgdir/opt/$pkgname || return 1
  tar -c ./ | tar -x -C $pkgdir/opt/$pkgname || return 1
  install -Dm755 ../$pkgname $pkgdir/usr/bin/$pkgname || return 1
  rm -f $pkgdir/opt/$pkgname/libQt* || return 1
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

