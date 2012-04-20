# Maintainer: Jonny Gerold <jonny@fsk141.com>
# Contributor: Tetsumaki <http://goo.gl/YMBdA>

pkgname=flamerobin-svn
pkgver=2219
pkgrel=1
pkgdesc='A tool to handle Firebird database management'
arch=('i686' 'x86_64')
url="http://www.flamerobin.org/"
license=('expat')
depends=('wxgtk' 'libfbclient' 'boost')
makedepends=('subversion')
provides=('flamerobin')
conflicts=('flamerobin')
source=()
md5sums=()

_svntrunk="https://flamerobin.svn.sourceforge.net/svnroot/flamerobin/trunk/flamerobin"
_svnmod=flamerobin

build() {
  cd $startdir/src
  msg "Connecting to SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/${_svnmod}"

  ./configure \
    --prefix=/usr \
    --with-wx-config=/usr/bin/wx-config

  make
}
package() {
  cd "$srcdir/${_svnmod}"
  make DESTDIR="${pkgdir}" install
}
