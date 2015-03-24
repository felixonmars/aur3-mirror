# Maintainer: Arttu Liimola <arttu.liimola at gmail dot com>
pkgname=irggu-client-qml-git
pkgver=20150323
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="QML client for connecting to IrGGu-Server"
url="http://irggu.arggu.ath.cx/client-qml/"
license=('GPL3')
depends=('irggu-client-lib-git' 'qt5-quickcontrols' 'qt5-svg')
makedepends=('extra-cmake-modules')
source=("${pkgname}::git+https://gitlab.com/irggu-client-qml/irggu-client-qml.git"
        'irggu-client.desktop')
sha256sums=(SKIP
            'a6c3576b349fc2890cbe341b1b8741d0ca35714a178a885f4ee9715227569592')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  
  install -Dm644 "${srcdir}/irggu-client.desktop" "${pkgdir}/usr/share/applications/irggu-client.desktop"
  install -Dm644 "${srcdir}/${pkgname}/icons/irggu.svg" "${pkgdir}/usr/share/pixmaps/irggu.svg"
}
