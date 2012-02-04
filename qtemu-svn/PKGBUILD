# Contributor: Reverie <reverie@takhis.net>

pkgname=qtemu-svn
pkgver=324
pkgrel=1
pkgdesc="Qt4 frontend for QEMU"
url="http://qtemu.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qemu' 'qt' 'libvncserver')
makedepends=('cmake' 'subversion')
conflicts=('qtemu')
provides=('qtemu')
source=()
md5sums=()

_svntrunk=https://qtemu.svn.sourceforge.net/svnroot/qtemu/trunk/qtemu
_svnmod=qtemu

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

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  rm -rf ${srcdir}/$_svnmod-build
}
