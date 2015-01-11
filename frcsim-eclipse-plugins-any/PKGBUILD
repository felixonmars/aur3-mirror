# Maintainer: Joseph Dillon <joseph@panicnot42.com>
pkgname=frcsim-eclipse-plugins-any
pkgver=0.1
pkgrel=1
pkgdesc="frcsim plugins for eclipse"
arch=(any)
url="http://first.wpi.edu/FRC/roborio/release/linux/pool/main/f/"
depends=(eclipse)
source=(http://first.wpi.edu/FRC/roborio/release/linux/pool/main/f/frcsim-eclipse-plugins/frcsim-eclipse-plugins_$pkgver-${pkgrel}_all.deb)
md5sums=('b9ec15b036ad50ca09449c339c105d55')

package() {
  tar xf data.tar.xz -C "${pkgdir}"
}
