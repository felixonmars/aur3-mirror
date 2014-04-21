# Maintainer: Yenal Lane <yenal.lane@gmail.com>

pkgname=pixelc
pkgver=1.0
pkgrel=0
pkgdesc="A utility to search and report the pixelcolor in a specified region of the screen."
arch=('i686' 'x86_64')
url="https://github.com/Yenals/PKGBUILDs/tree/master/arch/pixelc"
license=('GPL')
depends=('libx11' 'glibc')
install=pixelc.install
source=("pixelc.c")
sha256sums=('f862b4d5d99744c2e5710308cd0839335e0e4a7341db80d537ea19c1a545b6a1')

build() {
  cd "${srcdir}"
  gcc pixelc.c -lX11 -o pixelc || return 1
}

package() {
  install -Dm755 "${srcdir}/pixelc" "${pkgdir}/usr/bin/pixelc"
}