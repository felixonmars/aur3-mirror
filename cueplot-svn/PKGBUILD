# Contributor: noonov <noonov@gmail.com>

_pkgname=cueplot
pkgname=${_pkgname}-svn
pkgver=1079
pkgrel=3
pkgdesc="A GUI front-end to gnuplot, which uses Qt library"
arch=('i686' 'x86_64')
url="http://sourceforge.jp/projects/cueplot/"
license=('GPL2')
depends=('qt4' 'gnuplot')
makedepends=('subversion' 'cmake')
provides=('cueplot')
conflicts=('cueplot')
source=("${_pkgname}::svn+http://svn.sourceforge.jp/svnroot/cueplot/trunk")
md5sums=('SKIP')

pkgver() {
  cd ${SRCDEST}/${_pkgname}
  svnversion | tr -d -- '[A-z]'
}

build() {
  cd ${srcdir}/${_pkgname}

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make
}

package() {
  cd ${srcdir}/${_pkgname}

  make DESTDIR=${pkgdir} install
}
