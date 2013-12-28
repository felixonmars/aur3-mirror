# Maintainer: Martin Potier <mpo+PKGBUILD@marvid.fr>
pkgname=yapa
pkgver=0.1
pkgrel=4
pkgdesc="The external application packager for openmole projects."
arch=('i686' 'x86_64')
url="http://www.openmole.org"
license=('AGPLv3')
depends=('java-runtime')
optdepends=()
provides=("yapa")
conflicts=("yapa")
source=(http://www.openmole.org/files/$pkgname-$pkgver.tgz)
md5sums=('b4da024a65b3e2e87a3d7111f3b3a662')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/opt/bin
  mkdir -p $pkgdir/opt/lib

  sed -i "s/\.\./\/opt/" bin/yapa

  install -Dm 755 bin/yapa      $pkgdir/opt/bin/yapa
  install -Dm 755 lib/yapa.jar  $pkgdir/opt/lib/yapa.jar
}
