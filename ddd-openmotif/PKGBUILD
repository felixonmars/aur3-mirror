# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: Bernhard Walle <bernhard.walle at gmx dot de>
# Contributor: Alexandre Courbot <gnurou at gmail dot com>
# Contributor: Eric Belanger <eric at archlinux dot org>
# Contributor: Aurelien Foret <orelien at chez dot com>

pkgname=ddd-openmotif
pkgver=3.3.12
pkgrel=3
pkgdesc="A graphical front-end for command-line debuggers such as GDB, JDB, pydb, perl debugger... linked against OpenMotif"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/ddd/"
license=('GPL' 'LGPL')
depends=('ncurses' 'openmotif' 'libxaw' 'libxext')
provides=('ddd')
install=${pkgname}.install
source=(http://ftp.gnu.org/gnu/ddd/ddd-${pkgver}.tar.gz fixcompil.patch)
md5sums=('c50396db7bac3862a6d2555b3b22c34e' 'dd8ade3f1200825eb299cef2e8921c9b')

build() {
  cd "${srcdir}"/ddd-${pkgver}
  patch ddd/strclass.C < ../fixcompil.patch
  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info
  make
}

package() {
  cd "${srcdir}"/ddd-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}"/usr/share/info/dir
}

