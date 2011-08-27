# Contributor: rabyte <rabyte__gmail>

pkgname=gameandwatch-svn
pkgver=67
pkgrel=1
pkgdesc="A generic engine for simulation of Game & Watch games"
arch=('i686')
url="http://www.rangelreale.com/gamewatch.php"
license=('GPL2')
depends=('sdl_gfx' 'sdl_ttf' 'sdl_image' 'sdl_mixer' 'zziplib' 'boost>=1.33.1')
makedepends=('svn' 'autoconf' 'automake')
source=()
md5sums=()

_svntrunk=http://gameandwatch.svn.sourceforge.net/svnroot/gameandwatch/gamewatch/trunk
_svnmod=gameandwatch

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod
    svn up -r $pkgver
    cd ..
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_svnmod-build
  cp -rf $_svnmod/ $_svnmod-build/
  cd $_svnmod-build

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}
