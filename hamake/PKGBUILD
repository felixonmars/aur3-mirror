# Maintainer: Daniel Dias <dias AT archlinux DOT info>
pkgname=hamake
pkgver="2.0b"
pkgrel=3
pkgdesc="Make file for hadoop"
arch=('i686' 'x86_64')
url="https://code.google.com/p/hamake/"
license=('Apache')
depends=('java-runtime' 'hadoop')
provides=('hamake')
source=(
    "https://hamake.googlecode.com/files/hamake-2.0b-3.jar"
)

md5sums=('b35996385455b627edea3ee6e09cc50c')

package() {
  cd $srcdir
  install -d "$pkgdir/usr/share/java/hamake"
  install -m 744 "hamake-${pkgver}-${pkgrel}.jar" "$pkgdir/usr/share/java/hamake/hamake.jar"
}
