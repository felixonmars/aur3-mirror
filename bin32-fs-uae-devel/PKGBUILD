# Maintainer: grimi <grimi at poczta dot fm>

_pkgname=fs-uae
pkgname=bin32-fs-uae-devel
pkgver=2.1.3dev
pkgrel=1
pkgdesc="An Amiga multi-platform emulator based on UAE/WinUAE, with a focus on emulating games (development/32-bit version)."
arch=("x86_64")
url="http://fengestad.no/fs-uae/download-devel"
license=("GPL2")
depends=("lib32-sdl" "lib32-libpng" "lib32-glib2" "lib32-openal" "lib32-mesa" "lib32-glu" "lib32-gettext" "xdg-utils" "hicolor-icon-theme")
makedepends=("libtool-multilib")
provides=("fs-uae" "fs-uae-devel")
conflicts=("fs-uae" "fs-uae-devel")
install="${pkgname}.install"
source=(http://fengestad.no/${_pkgname}/devel/${pkgver}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('e24520874660616f9874313e2769d3b0')






build() {
   cd ${_pkgname}-${pkgver}

   # proper sdl-config
   sed 's|\(sdl-config\)|\1-32|g' -i Makefile libfsemu/Makefile

   make CC="gcc -m32" CXX="g++ -m32" CFLAGS="${CFLAGS/x86-64/i686}" CXXFLAGS="${CXXFLAGS/x86-64/i686}"
}


package() {
   cd ${_pkgname}-${pkgver}

   make install prefix="${pkgdir}/usr"
}


