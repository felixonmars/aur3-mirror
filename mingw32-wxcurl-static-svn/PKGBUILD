# Contributor: napa3um <napa3um@gmail.com>

pkgname=mingw32-wxcurl-static-svn
pkgver=839
pkgrel=1
pkgdesc="wxCURL is a simplified and integrated interface between LibCURL and wxWidgets."
arch=('i686' 'x86_64')
url="http://wxcode.sourceforge.net/components/wxcurl/"
license=('custom:wxWindows')

depends=('mingw32-wxmsw-static')
makedepends=('subversion' 'mingw32-w32api' 'mingw32-gcc' 'mingw32-binutils' 'mingw32-wxmsw-static')

conflicts=('mingw32-wxcurl' 'mingw32-wxcurl-svn')
provides=('mingw32-wxcurl' 'mingw32-wxcurl-svn')
source=()
md5sums=()

_svntrunk="https://wxcode.svn.sourceforge.net/svnroot/wxcode/trunk/wxCode/components/wxcurl/"
_svnmod="wxcurl"

# svn co https://wxcode.svn.sourceforge.net/svnroot/wxcode/trunk/wxCode/components/wxcurl/

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./configure --prefix=/usr/i486-mingw32 --with-wx-config=/usr/i486-mingw32/bin/wx-config --host=i486-mingw32
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
