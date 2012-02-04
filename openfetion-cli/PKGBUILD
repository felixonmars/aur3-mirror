# Maintainer: gebjgd <robinking623@gmail.com>
# Contributor: Philanecros <philanecros@gmail.com>

pkgname="openfetion-cli"
pkgver="2.1.0"
pkgrel="1"
pkgdesc="LiboFetion a fetion client for linux under CLI, using Fetion Protocol Version 4. (the name of program is cliofetion)"

arch=("i686" "x86_64")

url="http://code.google.com/p/ofetion/"
license=("GPL")

#groups=()

depends=("openssl" "libxml2" "sqlite3" )
makedepends=("pkg-config" "intltool" "cmake")
optdepends=("libnotify" "gstreamer0.10" "networkmanager" "libxss")

#provides=()
#conflicts=("openfetion")
#replaces=()

#backup=()
#options=()

#install=
#changelog=

source=("http://ofetion.googlecode.com/files/cliofetion-standalone-${pkgver}.tar.gz")
#noextract=()
md5sums=("db43d765eee9b774d9cb620c04320a96")

build() {
  cd "${srcdir}/cliofetion-standalone-${pkgver}"

  rm -rf build 

  mkdir build

  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release ..

  make
}

package() {
  cd "${srcdir}/cliofetion-standalone-${pkgver}/build"

  make DESTDIR="${pkgdir}/" install
}
