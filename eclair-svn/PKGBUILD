# Contributor: Feanor <fabio.falcinelli@gmail.com>
pkgname=eclair-svn
pkgver=39695
pkgrel=1
pkgdesc="EFL powered media player"
arch=('i686' 'x86_64')
license=('BSD')
url="http://www.enlightenment.org"
makedepends=('subversion')
conflicts=('eclair')
provides=('eclair')
depends=('esmart' 'evas' 'ecore' 'edje' 'emotion' 'sqlite3' 'taglib')
source=()
md5sums=()

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/OLD/eclair"
_svnmod="eclair"

build() {
  cd $srcdir

  msg "Connecting to $_svntrunk SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh --prefix=/usr/ --disable-static

  make || return 1
  make DESTDIR=$startdir/pkg install
  #install -D -m644 $startdir/src/elicit.desktop $startdir/pkg/usr/share/applications/elicit.desktop
  install -D -m644 AUTHORS $startdir/pkg/usr/share/licenses/$pkgname/AUTHORS
  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING

  rm -r $srcdir/$_svnmod-build
}

