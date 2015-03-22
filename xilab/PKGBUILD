# Maintainer: Victor Korobkovsky <vitkorob@gmail.com>
pkgname=xilab
pkgver=1.10.14
pkgrel=1
epoch=
pkgdesc="Graphical user interface for the XIMC family microcontrollers. It provides a simple GUI to control stepper and DC motors."
arch=('i686')
url="https://en.xisupport.com/projects/enxisupport/wiki/Software"
license=('unknown')
groups=()
depends=('libximc<=2.3.2' 'qwt>=6.0.0' 'qt4>=4.8.4')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
changelog=
source=("http://files.ximc.ru/$pkgname/$pkgname-$pkgver-1_i386.deb")
noextract=()
md5sums=('a03e86c77c9f07eddc0f55ad311674c4')

package() {
	tar -zxvf data.tar.gz -C $pkgdir/
}
