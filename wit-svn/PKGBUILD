# Maintainer: Alexander Duscheleit <alexander.duscheleit@gmail.com>
# Contributor: Gordin <9ordin @t gmail.com>
pkgname=wit-svn
pkgver=4002
pkgrel=1
pkgdesc="Wiimms ISO Tools is a set of command line tools to manipulate Wii ISO images and WBFS containers."
arch=('i686' 'x86_64')
url="http://www.gbatemp.net/index.php?showtopic=182236"
license=('GPL')
groups=()
depends=('fuse' 'bash')
makedepends=('subversion')
provides=('wwt' 'wit')
conflicts=(wit)
replaces=('wwt')
options=('!buildflags')

_svntrunk=http://opensvn.wiimm.de/wii/trunk
_svnmod=wiimms-iso-tools

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
  cd "$srcdir/$_svnmod-build/wiimms-iso-tools"

  # BUILD
  sed -i 's/svn info/LANG=C svn info/' setup.sh
  make INSTALL_PATH="$pkgdir/usr"
}

package () {
  cd "$srcdir/$_svnmod-build/wiimms-iso-tools"

  # Load titles from http://www.wiitdb.com/
  PATH=${PATH}:bin make titles

  # INSTALL
  make install
}
