#Contributors: schtroumpfette <fpeterschmitt@voila.fr>
#              Bmauet <careil.baptiste@hotmail.com>

pkgname=libcslp-svn
pkgver=63
pkgrel=1
pkgdesc="A C library for console applications"
url="http://code.google.com/p/consoleplus/"
license="LGPL"
arch=('i686' 'x86_64')
conflicts=('cslp')
provides=('cslp')
depends=('ncurses')
makedepends=('subversion')

_svntrunk="http://consoleplus.googlecode.com/svn/trunk/"
_svnmod=cslp

build() {
  cd "$startdir/src"
  if [ -d "$_svnmod"/.svn ]; then
      (cd "$_svnmod" && svn up -r $pkgver)
  else
      svn co "$_svntrunk" --config-dir ./ -r $pkgver "$_svnmod"
  fi
  cd "$_svnmod"
  make
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/include"
  mkdir "$pkgdir/usr/lib"
  make install DESTDIR="$pkgdir/usr"
}
