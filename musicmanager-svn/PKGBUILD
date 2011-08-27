# Contributor:  Bulat Sibgatullin <bulatsib@gmail.com>

pkgname=musicmanager-svn
pkgver=748
pkgrel=1
pkgdesc="Music Manager and Player (SVN version)"
url="http://code.google.com/p/gogglesmm/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('fox>=1.6.0' 'xine-lib>=1.0' 'sqlite3>=3.2.0' 'taglib' 'gtk2' 'dbus-glib')
makedepends=('subversion')
conflicts=('musicmanager')
provides=('musicmanager')
install=musicmanager.install

source=(musicmanager.install)
md5sums=(9e3610cd282362fb2f7e74264efc0f86)

_svntrunk=http://gogglesmm.googlecode.com/svn/trunk/
_svnmod=gogglesmm-read-only

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

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  rm -rf ${srcdir}/$_svnmod-build
}
# vim:syntax=sh
