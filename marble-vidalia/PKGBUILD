# Contributor: Rorschach <r0rschach@lavabit.com>
pkgname=marble-vidalia
pkgver=4029
pkgrel=1
pkgdesc="A generic geographical map widget - qt4 version patched for vidalia"
arch=('i686' 'x86_64')
url="http://edu.kde.org/marble"
license=('GPL')
depends=(qt)
makedepends=(cmake gpsd)
conflicts=(marble)
source=()
md5sums=()

_svntrunk="https://svn.vidalia-project.net/svn/marble/trunk"
_svnmod="marble"


build() {
  cd "$startdir/src"
  
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DQTONLY=ON || return 1
  make || return 1
  make DESTDIR="$startdir/pkg" install || return 1
}
