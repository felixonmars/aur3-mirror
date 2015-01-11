# Maintainer: Joseph Dillon <joseph@panicnot42.com>
pkgname=frcsim-gazebo-models-any
pkgver=0.3
pkgrel=1
pkgdesc="frcsim models for gazebo"
arch=(any)
url="http://first.wpi.edu/FRC/roborio/release/linux/pool/main/f/"
depends=(gazebo-hg)
source=(http://first.wpi.edu/FRC/roborio/release/linux/pool/main/f/frcsim-gazebo-models/frcsim-gazebo-models_$pkgver-${pkgrel}_all.deb)
md5sums=('658d95a759535f0fc6e1a8cb073cd74c')

package() {
  tar xf data.tar.xz -C "${pkgdir}"
}
