# Maintainer: gebjgd <robinking623@gmail.com>
# Contributor: Philanecros <philanecros@gmail.com>

pkgname="openfetion-all"
pkgver="2.2.1"
pkgrel="1"
pkgdesc="OFetion a fetion client for linux based on GTK+2.0, using Fetion Protocol Version 4. that is version with gtk gui and cli"

arch=("i686" "x86_64")

url="http://code.google.com/p/ofetion/"
license=("GPL")

#groups=()

depends=("openssl" "libxml2" "gtk2" "sqlite3")
makedepends=("pkg-config" "intltool" "cmake")
optdepends=("libnotify" "gstreamer0.10" "networkmanager" "libxss")

#provides=()
#conflicts=()
#replaces=()

#backup=()
#options=()

#install=
#changelog=

source=("http://ofetion.googlecode.com/files/openfetion-${pkgver}.tar.gz")
#noextract=()
md5sums=("a5d4fcb2a8a1cdf39cca7a116b596558")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  rm -rf build

  mkdir build

  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release ..

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make DESTDIR="${pkgdir}/" install
}
