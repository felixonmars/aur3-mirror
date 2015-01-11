# Maintainer: Joseph Dillon <joseph@panicnot42.com>
pkgname=frcsim-libwpilibsim-cpp-bin
pkgver=0.1
pkgrel=1
pkgdesc="WPILib for frcsim"
arch=(i686 x86_64)
url="http://first.wpi.edu/FRC/roborio/release/linux/pool/main/f/"
depends=(protobuf gazebo)
if test "$CARCH" == x86_64; then
  source=(http://first.wpi.edu/FRC/roborio/release/linux/pool/main/f/frcsim-libwpilibsim-cpp/frcsim-libwpilibsim-cpp_$pkgver-${pkgrel}_amd64.deb)
else
  source=(http://first.wpi.edu/FRC/roborio/release/linux/pool/main/f/frcsim-libwpilibsim-cpp/frcsim-libwpilibsim-cpp_$pkgver-${pkgrel}_i386.deb)
fi
md5sums=('b21c7d871bfc7b56729b3cb561c4bc78')

package() {
  tar xf data.tar.xz -C "${pkgdir}"
}
