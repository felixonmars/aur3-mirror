# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Tomáš Frýda <tm3da@email.cz>

pkgname=cryptoolinux
_pkgname=CrypTooLinux
pkgver=0.2
pkgrel=4
pkgdesc="Cryptoolinux is a tool to learn cryptography and cryptanalysis."
arch=(i686 x86_64)
url="http://www.cryptoolinux.net"
license=('GPL')
depends=(qt4)
makedepends=(cmake)
source=("http://download.gna.org/cryptoolinux/${_pkgname}-${pkgver}-english_help.tar.gz")
sha512sums=("1d12fd85482f1d968b5f18185c2393727bcb655a665a1933960a14a639ab96b8edecfd6889ec6c1ff241475b4bf1c401b3212583505d99332f897db9bb1399cc")

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed -i 's/ QtAssistantClient//g' src/CMakeLists.txt
  sed -i 's/${math_libraries})/${math_libraries} libalgebra)/g' src/CMakeLists.txt
  sed -i 's/ ${QT_QTASSISTANT_INCLUDE_DIR}//g' src/CMakeLists.txt
  sed -i 's/assistantClient = new/\/* assistantClient = new/g' src/mainWindow.cpp
  sed -i 's/#include <QAssistantClient>/\/* #include <QAssistantClient> *\//g' src/mainWindow.cpp
  sed -i 's/arguments);/arguments); *\//g' src/mainWindow.cpp
  sed -i 's/void mainWindow::assistant/\/* void mainWindow::assistant()/g' src/mainWindow.cpp
  sed -i '132i*\/' src/mainWindow.cpp
  sed -i 's/void assistant();/\/* void assistant(); *\//g' src/mainWindow.h
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cmake CMakeLists.txt
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}

