# Maintainer: Joseph Dillon <joseph@panicnot42.com>
pkgname=frcsim-any
pkgver=0.1
pkgrel=1
pkgdesc="A simulator for robots competing in FIRST"
arch=(any)
url="http://first.wpi.edu/FRC/roborio/release/linux/pool/main/f/"
depends=(frcsim-eclipse-plugins-any frcsim-eclipse-toolchain-plugin-any frcsim-gazebo-models-any frcsim-gazebo-plugins-bin frcsim-libwpilibsim-cpp-bin)
source=(http://first.wpi.edu/FRC/roborio/release/linux/pool/main/f/frcsim/frcsim_$pkgver-${pkgrel}_all.deb)
md5sums=('0f930f12bec34039181fb39084271d80')

package() {
  tar xf data.tar.xz -C "${pkgdir}"
}
