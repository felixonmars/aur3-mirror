# Contributor: totoloco <totoloco en gmail>

pkgname=qtmpc-svn
pkgver=308
pkgrel=1
pkgdesc="Qt4-based front-end for MPD. svn build"
arch=('i686' 'x86_64')
url="http://qtmpc.lowblog.nl/"
license=('GPL')
depends=('qt')
makedepends=('automoc4' 'cmake' 'subversion')
provides=('qtmpc')
conflicts=('qtmpc')
replaces=('qtmpc')

source=()
md5sums=()

_svntrunk=http://qtmpc.lowblog.nl/svn/trunk
_svnmod=qtmpc

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  rm -rf ${srcdir}/${_svnmod}/build
  mkdir ${srcdir}/${_svnmod}/build
  cd ${srcdir}/${_svnmod}/build
  cmake .. -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr
  make || return 1
  make install || return 1

  # optional:
  mv ${pkgdir}/usr/bin/QtMPC ${pkgdir}/usr/bin/qtmpc
  sed -i 's/^Exec=QtMPC/Exec=qtmpc/' ${pkgdir}/usr/share/applications/kde4/QtMPC.desktop
}
