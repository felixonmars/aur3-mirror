# Maintainer: Melvin 'Nivl' Laplanche <melvin.laplanche+dev@gmail.eu>
pkgname=raytracer42-svn
pkgver=20110601
pkgrel=1
pkgdesc="A basic raytracer."
arch=('i686', 'x86_64')
url="http://code.google.com/p/raytracer-42/"
license=('GPL3')
depends=('qt' 'lib3ds' 'boost')
makedepends=('svn')
source=()
md5sums=()
provides=('raytracer42')

_svnroot='http://raytracer-42.googlecode.com/svn/trunk/'
_svnname='raytracer42'

build() {
  cd $srcdir

  msg 'Connecting to SVN server...'
  if [ -d $_svnname ]; then
     rm -Rf $_svnname
  fi
  svn checkout $_svnroot raytracer42
}

package() {
  msg 'Buildind raytracer-42'
  cd $srcdir/$_svnname
  ./configure
  make
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/$_svnname/raytracer42 $pkgdir/usr/bin/
}
