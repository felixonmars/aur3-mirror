# Contributor: Coenraad van der Westhuizen <chwesthuizen@gmail.com>
pkgname=xpertmud-svn
pkgver=1375
pkgrel=1
pkgdesc="An extensible, scriptable MUD client"
arch=(i686)
url="http://xpertmud.sourceforge.net/"
license="GPL"
depends=('kdelibs' 'perl' 'python' 'ruby')
makedepends=('subversion')
source=()
md5sums=()

_svntrunk="https://xpertmud.svn.sourceforge.net/svnroot/xpertmud/trunk"
_svnmod="xpertmud"

build() {
  msg "Starting SVN checkout..."

  if [ -d $_svnmod/.svn ]; then
     (cd $_svnmod && svn up -r $pkgver)
     else
     svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout complete or server timeout"
  msg "Starting make..."

  cd $startdir/src/xpertmud/xpertmud/

  make -f Makefile.dist
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
