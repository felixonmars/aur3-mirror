# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Maintainer: Chuan Ji <jichuan89@gmail.com>

pkgname=libdom-svn
pkgver=13878
pkgrel=1
pkgdesc="A library for working with W3C DOM"
arch=('x86_64' 'i686')
url="http://www.netsurf-browser.org/projects/libdom/"
license=('MIT')
makedepends=('subversion' 'libwapcaplet' 'libparserutils' 'hubbub')
provides=('libdom')
_svntrunk=svn://svn.netsurf-browser.org/trunk/libdom
_svnmod=libdom

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  cd $_svnmod

  CFLAGS="$CFLAGS -fno-strict-aliasing" 
  make PREFIX=/usr COMPONENT_TYPE="lib-shared" 
  make PREFIX=/usr COMPONENT_TYPE="lib-static"
}

package() {
  cd $_svnmod

  make install PREFIX=/usr DESTDIR="${pkgdir}" COMPONENT_TYPE="lib-shared"   
  make install PREFIX=/usr DESTDIR="${pkgdir}" COMPONENT_TYPE="lib-static"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
