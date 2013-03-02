# Maintainer: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Ricardo Martins <ricardo+aur@scarybox.net>
# Contributor: Larry Hajali <larryhaja [at] gmail [dot] com>

pkgname=qwit
pkgver=1.1_pre2
pkgrel=4
pkgdesc="Qt4 cross-platform client for Twitter"
arch=('i686' 'x86_64')
url="http://code.google.com/p/qwit/"
license=('GPL3')
depends=('qt4' 'qoauth' 'qca-ossl')
makedepends=('sed' 'automoc4' 'cmake')
install=qwit.install
source=("http://qwit.googlecode.com/files/$pkgname-${pkgver/_/-}-src.tar.bz2")
md5sums=('e8775236e5a8a83937bdf009193b7618')

build() {
  cd "$srcdir"/$pkgname-${pkgver/_/-}-src || return 1

  # Fix .desktop item.
  sed -i 's|Internet||' $pkgname.desktop
  # Fix CMakeLists.txt
  sed -i \
    -e 's|\${QT_BINARY_DIR}|bin|' -e 's|/qca2||' \
    -e 's|/icons|/pixmaps|' CMakeLists.txt
  # Compile.
  mkdir build
  cd build
    cmake -G "Unix Makefiles" \
      -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
      -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
      -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
      -DCMAKE_BUILD_TYPE=Release ..

  make VERBOSE=1
}

package() {
  cd "$srcdir"/$pkgname-${pkgver/_/-}-src/build || return 1

  # Install program.
  make install DESTDIR="$pkgdir"
}
