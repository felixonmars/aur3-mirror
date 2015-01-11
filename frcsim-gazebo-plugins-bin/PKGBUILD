# Maintainer: Joseph Dillon <joseph@panicnot42.com>
pkgname=frcsim-gazebo-plugins-bin
pkgver=0.2
pkgrel=1
pkgdesc="Gazebo plugins for frcsim"
arch=(i686 x86_64)
url="http://first.wpi.edu/FRC/roborio/release/linux/pool/main/f/"
depends=(gazebo-hg)
if test "$CARCH" == x86_64; then
  source=(http://first.wpi.edu/FRC/roborio/release/linux/pool/main/f/frcsim-gazebo-plugins/frcsim-gazebo-plugins_$pkgver-${pkgrel}_amd64.deb)
else
  source=(http://first.wpi.edu/FRC/roborio/release/linux/pool/main/f/frcsim-gazebo-plugins/frcsim-gazebo-plugins_$pkgver-${pkgrel}_i386.deb)
fi
md5sums=('88a26c7443e10d1b8d76ec39fb39a35d')

package() {
  tar xf data.tar.xz -C "${pkgdir}"
}
