# Maintainer: kfgz <kfgz at interia pl>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Roman Timushev <romiktat gmail dot com>

pkgname=cuneiform-qt-git
_pkgname=cuneiform-qt
pkgver=0.1.2.alt1.4.gbdc9497
pkgrel=1
pkgdesc="QT4-based GUI for Cuneiform OCR"
arch=(i686 x86_64)
url="http://en.altlinux.org/Cuneiform-Qt"
license=('GPL')
depends=('cuneiform' 'qt4>=4.3')
makedepends=('git')
source=('git+git://git.altlinux.org/people/cas/packages/cuneiform-qt.git')
sha512sums=('SKIP')

pkgver() {
  cd "$SRCDEST/${_pkgname}"
  git describe --always | sed 's|-|.|g' | sed 's|cuneiform.qt.||g'
}

build() {
  cd "${srcdir}/cuneiform-qt/cuneiform-qt"
  DESTDIR="${pkgdir}" PREFIX="/usr" qmake-qt4
  make
}

package() {
  cd "${srcdir}/cuneiform-qt/cuneiform-qt"
  make install INSTALL_ROOT="${pkgdir}"
}
