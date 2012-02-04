# Maintainer: eagletmt <eagletmt@gmail.com>
pkgname=jtssplitter-svn
_realname=jtssplitter
pkgver=886
pkgrel=1
pkgdesc="MPEG2-TS file splitter"
arch=('any')
url="http://www.rec10.org/"
license=('LGPL')
depends=('java-runtime')
makedepends=('subversion' 'java-environment')
provides=($_realname)
source=($_realname)
md5sums=('e5122034aeed7d2852b5e1d9d12995e4')

_svnmod=jTsSplitter
_svntrunk=http://svn.sourceforge.jp/svnroot/rec10/$_svnmod/trunk

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

  cd src
  javac $_realname/*.java $_realname/data/*.java
  jar cfe $_realname.jar $_realname.Main $_realname/*.class $_realname/data/*.class
}

package() {
  cd "$srcdir/$_svnmod-build"

  mkdir -p "$pkgdir/usr/share/java"
  install -m644 src/$_realname.jar "$pkgdir/usr/share/java/"

  mkdir -p "$pkgdir/usr/bin/"
  install -m755 "$srcdir/$_realname" "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
