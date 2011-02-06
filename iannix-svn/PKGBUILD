# Contributor: agroschim <agroschim@gmx.de>

pkgname=iannix-svn
pkgver=140
pkgrel=1
pkgdesc="A score editor based on the UPIC sequencer by Iannis Xenakis"
arch=('i686' 'x86_64')
url="http://www.le-hub.org/lang/fr/iannix"
license=('GPL')
depends=('qt')
conflicts=('iannix')
source=()
md5sums=()

_svntrunk=https://iannix.svn.sourceforge.net/svnroot/iannix/v0.7
_svnmod=iannix

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
  cd "$srcdir/$_svnmod-build"

  #
  # build
  #

  qmake
  make
  install -pD bin/IanniX $pkgdir/usr/bin/iannix
}
