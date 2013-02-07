# Maintainer: sudoku <nessuno[at]lavabit[dot]com>
# License: Public Domain
pkgname=pqmethod
pkgver=2.33
pkgrel=0
pkgdesc="PQMethod is a statistical program tailored to the requirements of Q studies"
url="http://schmolck.org/qmethod/"
arch=('x86_64' 'i686')
license=('GPL')
makedepends=('g77')
install='pqmethod.install'
source=("http://schmolck.userweb.mwn.de/qmethod/pqm233s.zip")

build() {
  mkdir -p "$pkgdir/usr/bin"
  cd "${srcdir}"
  g77-3.4 "$pkgname.for" -o "$pkgname"
  cp $srcdir/* $pkgdir/usr/bin 
 }
md5sums=('60d8db888d11cf3d5b1a7995347e4bdf')
