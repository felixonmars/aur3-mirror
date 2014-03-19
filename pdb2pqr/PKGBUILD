# Maintainer: Alexander Minges <alexander.minges at gmail dot com>
# Contributor: Eduardo Martins Lopes < edumlopes at gmail dot com >

pkgname=pdb2pqr
pkgver=1.8
pkgrel=2
pkgdesc="A Python software package that automates many of the common tasks of preparing structures for continuum electrostatics calculations"
arch=('i686' 'x86_64')
url="http://www.poissonboltzmann.org/"
license="GPL"
depends=('blas' 'lapack' 'gcc-libs' 'apbs')
makedepends=()
conflicts=('apbs-pdb2pqr')
install=pdb2pqr.install

source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz pdb2pqr.install)
sha256sums=('78470c21e5dc7afa12d782559b11d2cb04b755d93086bb80a43bd09fa0c3521f'
            '3003a9e9c2b58ddeff92659aca76371dd169efe9fc9643232762a3c7efc9a1b6')

build() {  
  cd $srcdir/$pkgname-$pkgver  
  ./configure --prefix=$pkgdir/usr/lib/python2.7/site-packages/$pkgname --localstatedir=$pkgdir --with-python=/usr/bin/python2
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install
}
