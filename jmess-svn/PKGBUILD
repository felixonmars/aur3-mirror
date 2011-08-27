# Maintainer: Bernardo Barros <bernardobarros@gmail.com>

pkgname=jmess-svn  
pkgver=40
pkgrel=1 
pkgdesc=" A utility to save your audio connections (mess)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/jmess-jack/"
license=('GPL')
depends=('jack')
makedepends=('qt')
provides=('jmess')
conflicts=('jmess')

_svntrunk=" http://jmess-jack.googlecode.com/svn/trunk"
_svnmod=jmess

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build/jmess/src"

  qmake jmess.pro
  make release
}

 package() {

  mkdir -p "$pkgdir/usr/bin"
  cd "$srcdir/$_svnmod-build/jmess/src"
  install -Dm755 jmess "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
