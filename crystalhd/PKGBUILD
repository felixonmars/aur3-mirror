# Contributor: Lex Rivera <x-demon@x-demon.org>
pkgname=crystalhd
pkgver=20091229
pkgrel=1
pkgdesc="Broadcom Crystal HD kernel module"
arch=('i686' 'x86_64')
url="http://git.wilsonet.com/crystalhd.git/"
license=('GPL2')
install=crystalhd.install
depends=()
makedepends=("hd2u")
optdepends=()
conflicts=()
source=("http://www.broadcom.com/docs/support/crystalhd/crystalhd_linux_${pkgver}.zip"
        "buildmodule-crystalhd")

md5sums=('fe11b1960f3ceda55ca6c2dd2d61ccff'
         '6b0d88e490e81db2f9d4b53c02db8f9d')

build() {
  cd $srcdir/$pkgname/driver/linux
  dos2unix *
  mkdir -p ${pkgdir}/usr/src/buildmodule/crystalhd
  cp -r $srcdir/$pkgname/driver/linux/* ${pkgdir}/usr/src/buildmodule/crystalhd
  install -Dm755 ${srcdir}/buildmodule-crystalhd ${pkgdir}/usr/sbin/buildmodule-crystalhd
}
# vim:syntax=sh
