# Contributor: Brendan Long <korin43 at gmail dot com>

pkgname=phc-svn
pkgver=3303
pkgrel=1
pkgdesc="the open source php compiler - from svn"
arch=('i686' 'x86_64')
url="http://www.phpcompiler.org/"
license=('BSD')
groups=()
depends=('php' 'php-embed')
makedepends=('boost' 'gc')
optdepends=('graphviz: to view graphical output (like syntax trees)' 
            'xerces-c: support for XML parsing (not needed for XML unparsing)')
provides=('phc')
conflicts=('phc')
_svntrunk="http://phc.googlecode.com/svn/trunk/"
_svnmod=phc-read-only
md5sums=()

build() {
  cd "${srcdir}"
  msg "Connecting to SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"

  cd $_svnmod
  touch src/generated/*
  
  LDFLAGS="" ./configure --prefix=/usr --with-php=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp doc/license/LICENSE $pkgdir/usr/share/licenses/$pkgname/COPYING
}
