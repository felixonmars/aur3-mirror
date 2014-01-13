# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: vbPadre <vbpadre@gmail.com>

pkgname=coolreader
pkgver=3.0.56
pkgrel=5
pkgdesc='E-Book viewer for comfort reading (epub (non-DRM), fb2, txt, rtf, html, chm, tcr formats supported)'
arch=('i686' 'x86_64')
url='http://www.coolreader.org/e-index.htm'
license=('GPL2')
depends=('qt4')
# 'zlib' 'libpng' 'libjpeg' 'freetype2' depends on 'qt'
makedepends=('cmake')
provides=('cr3-qt4' 'coolreader3' 'coolreader3-git' 'coolreader-git')
conflicts=('cr3-qt4' 'coolreader3' 'coolreader3-git' 'coolreader-git')
install="${pkgname}.install"
source=("http://sourceforge.net/projects/crengine/files/CoolReader3/cr3-${pkgver}/cr3_${pkgver}.orig.tar.gz")
md5sums=('cc221a608a1b5fea2db5a519c14eeb39')

prepare() {
  # temp
  mv "${srcdir}/cr${pkgver}-7/" "${srcdir}/cr3-${pkgver}/"

  # freetype2 patch
  sed -i 's/freetype\//freetype2\//g' "${srcdir}/cr3-${pkgver}/crengine/src/lvfntman.cpp"
}

build() {
  mkdir -p "${srcdir}/cr3-${pkgver}/qtbuild"
  cd "${srcdir}/cr3-${pkgver}/qtbuild"
  cmake -D GUI=QT \
        -D QT_QMAKE_EXECUTABLE=qmake-qt4 \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/cr3-${pkgver}/qtbuild"
  make install DESTDIR="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
