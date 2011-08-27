# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=cel-svn
pkgver=3791
pkgrel=1
pkgdesc="A set of plugins and applications to specifically help with writing games"
arch=('i686' 'x86_64')
url="http://www.crystalspace3d.org/main/CEL"
license=('LGPL')
depends=('crystalspace-svn')
makedepends=('pkgconfig' 'autoconf' 'automake' 'subversion' 'jam')
provides=('cel')
conflicts=('cel')
source=()
md5sums=()

_svntrunk=http://cel.svn.sourceforge.net/svnroot/cel/cel/trunk
_svnmod=cel

build() {
  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod
    svn up -r $pkgver
    cd ..
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  rm -rf $_svnmod-build
  cp -rf $_svnmod/ $_svnmod-build/
  cd $_svnmod-build

  ./autogen.sh

  msg "Starting make..."

  ./configure --prefix=/usr --sysconfdir=/etc

  jam || return 1
  jam DESTDIR=$pkgdir install
}
