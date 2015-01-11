# Maintainer: Joseph Dillon <joseph@panicnot42.com>
pkgname=frcsim-eclipse-toolchain-plugin-any
pkgver=0.1
pkgrel=1
pkgdesc="Eclipse toolchain for frcsim"
arch=(any)
url="http://first.wpi.edu/FRC/roborio/release/linux/pool/main/f/"
depends=()
makedepends=()
source=(http://first.wpi.edu/FRC/roborio/release/linux/pool/main/f/frcsim-eclipse-toolchain-plugin/frcsim-eclipse-toolchain-plugin_$pkgver-${pkgrel}_all.deb)
md5sums=('cc380a382801af57c4370209a00d73f4')

package() {
  tar xf data.tar.xz -C "${pkgdir}"
}
