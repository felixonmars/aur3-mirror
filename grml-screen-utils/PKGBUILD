# Maintainer: DeadSurgeon42 <deadsurgeon42 at gmail dot com>
pkgname=grml-screen-utils
pkgver=1
pkgrel=1
pkgdesc="CPU helper scripts used in Grml screenrc hardstatus"
arch=('any')
url="https://github.com/grml/grml-scripts-core/"
license=('GPL')
makedepends=('dietlibc')
groups=()
source=(git+https://github.com/grml/grml-scripts-core.git)
sha256sums=('SKIP')

build() {

cd $srcdir/grml-scripts-core/compile
make

}

package() {

mkdir -p $pkgdir/usr/bin/
cd $srcdir/grml-scripts-core/compile
cp cpu-screen ip-screen $pkgdir/usr/bin/

}
