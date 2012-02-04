# Maintainer: gebjgd <robinking623@gmail.com>
# Contributor: Philanecros <philanecros@gmail.com>

pkgname="openfetion"
pkgver="2.2.2"
pkgrel="1"
pkgdesc="OFetion a fetion client for linux based on GTK+2.0, using Fetion Protocol Version 4. that is openfetion with GTK GUI"

arch=("i686" "x86_64")

url="http://code.google.com/p/ofetion/"
license=("GPL")

#groups=()

depends=("openssl" "libxml2" "gtk2" "sqlite3" "librsvg")
makedepends=("pkg-config" "intltool" "cmake")
optdepends=("libnotify" "gstreamer0.10" "networkmanager" "libxss" "libindicator" "libindicate-gtk")

#provides=()
#conflicts=("openfetion-cli")
#replaces=()

#backup=()
#options=()

#install=
#changelog=

source=("http://ofetion.googlecode.com/files/${pkgname}-standalone-${pkgver}.tar.gz")
#noextract=()
md5sums=("7d5052a528fda8ce5db04affc46df3ac")

build() {
  cd "${srcdir}/${pkgname}-standalone-${pkgver}"

  rm -rf build

  mkdir build

  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release ..

  make
}

package() {
  cd "${srcdir}/${pkgname}-standalone-${pkgver}/build"

  make DESTDIR="${pkgdir}/" install
}
