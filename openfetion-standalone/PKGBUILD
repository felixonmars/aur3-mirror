# Maintainer: gebjgd <robinking623@gmail.com>
# Contributor: Philanecros <philanecros@gmail.com>

pkgname="openfetion-standalone"
pkgver="2.1.0"
pkgrel="1"
pkgdesc="OFetion a fetion client for linux based on GTK+2.0, using Fetion Protocol Version 4."

arch=("i686" "x86_64")

url="http://code.google.com/p/ofetion/"
license=("GPL")

#groups=()

depends=("openssl" "libxml2" "gtk2" "libnotify" "gstreamer0.10"
         "sqlite3" "networkmanager" "libxss")
makedepends=("pkg-config" "intltool")
#optdepends=()

#provides=()
#conflicts=()
#replaces=()

#backup=()
#options=()

#install=
#changelog=

source=("http://ofetion.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
#noextract=()
md5sums=("d26370e5783a858bb688f487f74481ac")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir build

  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release ..

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make DESTDIR="${pkgdir}/" install
}
