# Maintainer: mickael9 <mickael9 at gmail dot com>
pkgname=pidgin-capsnot-svn
pkgver=4
pkgrel=1
pkgdesc="Keyboard LED Notification for Pidgin"
arch=(i686 x86_64)
url="http://code.google.com/p/pidgin-capsnot/"
license=('GPL3')
depends=('pidgin')
makedepends=('subversion')

_svntrunk='http://pidgin-capsnot.googlecode.com/svn/trunk/'
_svnmod=pidgin-capsnot

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  make capsnot.so
}

package() {
  cd "$srcdir/$_svnmod-build"
  install -D capsnot.so "$pkgdir/usr/lib/pidgin/capsnot.so"
}

# vim:set ts=2 sw=2 et:
