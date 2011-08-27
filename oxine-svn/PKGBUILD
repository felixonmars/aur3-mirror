# Contributor: Andrea Cimitan <andrea.cimitan@gmail.com>

pkgname=oxine-svn
_realname=oxine
pkgver=2382
pkgrel=1
pkgdesc="oxine is a lightweight, purely osd based xine frontend for set-top boxes and home entertainment systems."
arch=(i686 x86_64)
depends=('xine-lib')
url="http://oxine.sourceforge.net/"
makedepends=('subversion' 'cvs' 'libcdio')
provides=('oxine')
conflicts=('oxine')
source=()
md5sums=()

_svnmod="oxine"
_svntrunk="https://svn.sourceforge.net/svnroot/oxine/trunk/oxine"


build() {
  msg "Getting sources..."
  svn co $_svntrunk $_svnmod -r $pkgver
  cd $_svnmod

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}

