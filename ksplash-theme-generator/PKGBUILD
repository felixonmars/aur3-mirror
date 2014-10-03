# Maintainer: Dylon Edwards <deltaecho@archlinux.us>

pkgname=ksplash-theme-generator
pkgver=0.4
pkgrel=3
pkgdesc="Generates a splash screen for KDE4 with your current wallpaper and plasma/icon theme."
url="http://www.kde-apps.org/content/show.php/Ksplash+theme+generator?content=104456"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdebase-runtime')
makedepends=('automoc4' 'cmake')
install="${pkgname}.install"
provides=("${pkgname}=${pkgver}")
source=("http://www.kde-apps.org/CONTENT/content-files/104456-KsplashThemeGenerator.tar.gz")
sha1sums=('758a6c5f16864fd6d1318f9f4d6958201b232a7f')

prepare() {
  rm -fr build
  cp -R KsplashThemeGenerator build
}

build() {
  cd build
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake4
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
