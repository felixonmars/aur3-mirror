# Contributor: Ray Rashif <schivmeister@gmail.com>

pkgname=slv2-svn
pkgver=2292
pkgrel=2
pkgdesc="Library for LV2 hosts"
arch=(i686 x86_64)
url="http://drobilla.net/software/slv2"
license=('GPL')
depends=('lv2core' 'redland' 'jack')
makedepends=('subversion' 'python')
provides=('slv2' 'libslv2')
conflicts=('slv2' 'libslv2' 'libslv2-svn')
replaces=('libslv2-svn')
options=('!libtool')
install=$pkgname.install
source=()
md5sums=()

_svntrunk=http://svn.drobilla.net/lad/trunk
_svnmod=lad

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  cd $_svnmod/slv2

  ./waf configure --prefix=/usr
  ./waf build $MAKEFLAGS || return 1
  ./waf install --destdir="$pkgdir"
}
