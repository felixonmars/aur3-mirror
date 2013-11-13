# Maintainer: Boohbah <boohbah at gmail dot com>

pkgname=american-fuzzy-lop-svn
pkgver=r41
pkgrel=1
pkgdesc="A fuzzer using a novel type of compile-time instrumentation (svn version)"
arch=('i686' 'x86_64')
url="https://code.google.com/p/american-fuzzy-lop/"
license=('Apache')
makedepends=('subversion')
provides=('american-fuzzy-lop')
conflicts=('american-fuzzy-lop')
source=('svn+http://american-fuzzy-lop.googlecode.com/svn/trunk/')
md5sums=('SKIP')

_svntrunk='http://american-fuzzy-lop.googlecode.com/svn/trunk/'
_svnmod=afl

pkgver() {
  cd "$srcdir/$_svnmod"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

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

  # Fix paths because there is no configure script
  sed -i "s:/usr/local/bin:${pkgdir}/usr/bin:" Makefile
  sed -i "s:/usr/local/lib:${pkgdir}/usr/lib:" Makefile
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  mkdir -p $pkgdir/usr/{bin,lib,}
  make install
}
