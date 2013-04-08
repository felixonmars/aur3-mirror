# Maintainer: TDY <tdy@archlinux.info>

pkgname=yzis
pkgver=1.0_alpha1
_commit=1f655066f8cf
pkgrel=1
pkgdesc="A fast, powerful editor inspired by Vim"
arch=('i686' 'x86_64')
url="http://freecode.com/projects/yzis"
license=('LGPL' 'GPL')
depends=('file' 'lua51' 'qt4')
makedepends=('cmake' 'doxygen')
optdepends=('qyzis: QT interface')
source=($pkgname-$pkgver.tar.bz2::http://sources.freehackers.org/Yzis/archive/1f655066f8cf.tar.bz2
        $pkgname-$pkgver-logging.diff)
sha256sums=('03ccea750a53ff00c96d85cfaa38d3023376eaf054d8d1d534ccc611cad3ee2b'
            'e889092285dfa2f1ef094b4fc27d22083ca64ba14b4a5329d6269e663ee2fa4e')

build() {
  cd "$srcdir/Yzis-$_commit"
  patch -Np1 -i ../$pkgname-$pkgver-logging.diff

  cd cmake
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_QYZIS=OFF \
    -DENABLE_LIBYZISRUNNER=OFF \
    -DENABLE_DOCUMENTATION=OFF \
    -DLIBLUA51_INCLUDE_DIR=/usr/include/lua5.1 \
    -DQT_QMAKE_EXECUTABLE=/usr/lib/qt4/bin/qmake
  make
}

check() {
  cd "$srcdir/Yzis-$_commit/cmake"
  make test
}

package() {
  cd "$srcdir/Yzis-$_commit/cmake"
  make DESTDIR="$pkgdir" install
  ln -sf n$pkgname "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
