# Maintainer: Eduard Bachmakov <e.bachmakov@gmail.com>
pkgname=phoebe-gui-svn
pkgver=1981
pkgrel=1
pkgdesc="PHysics Of Eclipsing BinariEs: gui (stable)"
arch=('x86_64')
url="http://phoebe.fmf.uni-lj.si/"
license=('GPL')
depends=() #TODO
makedepends=('subversion')
conflicts=('phoebe-gui')

_svntrunk=svn://svn.code.sf.net/p/phoebe/code/stable/phoebe-gui
_svnmod=phoebe

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

  ./configure 'LDFLAGS=-lm' --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
