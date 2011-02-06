# Contributor: Kevin Whitaker <eyecreate at gmail dot com>

pkgname=edpcs
pkgver=1.0.0
pkgrel=1
pkgdesc="Schematic pseudocode editor for education."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/edpcs/"
license=('GPL')
depends=('qtmod')
source=("http://softlayer.dl.sourceforge.net/project/edpcs/1- Release versions (stable)/1.0/edpcs_v$pkgver-src.zip")
md5sums=('efcf7badd9c1d946781d4bccc414e231')


build() {
  cd $srcdir/$pkgname
  lrelease edpcs.pro || return 1
  qmake || return 1
  make || return 1
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  cp $srcdir/$pkgname/edpcs $pkgdir/usr/bin
} 
