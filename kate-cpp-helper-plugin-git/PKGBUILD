# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=kate-cpp-helper-plugin-git
pkgver=188babc
pkgrel=1
pkgdesc="Simplify C/C++ programmers life, when using Kate"
arch=('i686' 'x86_64')
url="https://github.com/zaufi/kate-cpp-helper-plugin"
license=('GPL3')
depends=('kdesdk-kate' 'clang' 'boost-libs' 'xapian-core')
makedepends=('git' 'boost' 'cmake' 'automoc4')
source=(kate-cpp-helper-plugin::git://github.com/zaufi/kate-cpp-helper-plugin.git)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/kate-cpp-helper-plugin"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/kate-cpp-helper-plugin"

  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/kate-cpp-helper-plugin/build"

  make DESTDIR="${pkgdir}" install
}
