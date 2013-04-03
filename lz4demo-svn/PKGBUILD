# Maintainer: Jannis Harder <jix@jixco.de>
pkgname=lz4demo-svn
pkgver=91
pkgrel=1
pkgdesc="Command-line interface for the fast lz4 compression algorithm."
arch=('i686' 'x86_64')
url="http://code.google.com/p/lz4/"
license=('BSD')
depends=('glibc')
makedepends=('subversion')

_svntrunk=http://lz4.googlecode.com/svn/trunk/
_svnmod=lz4

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
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  make lz4demo
}

package() {
  cd "$srcdir/$_svnmod-build"
  install -v -d "$pkgdir/usr/bin"
  install -v lz4demo "$pkgdir/usr/bin"

  sed -ne '\|\*/|q;0,\|/\*|d;p' < lz4.c > LICENSE

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
