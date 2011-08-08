# Maintainer: Maximilian Kirchner <arch@schakalno1.de>
# Contributor: Maximilian Kirchner <arch@schakalno1.de>
pkgname=jscribble
pkgver=1.1.1
pkgrel=1
pkgdesc="a graphical notepad with as many pages as you want. You can organize your notes within notepads. Best used with a graphics tablet or touchscreen."
arch=(any)
url="https://launchpad.net/jscribble"
license=('GPL2')
depends=('java-runtime>=1.6')
makedepends=('jdk' 'gettext')
source=('http://launchpad.net/jscribble/trunk/1.1.1/+download/jscribble_1.1.1.orig.tar.gz')
md5sums=('5969eeed9d10b880201ded80d837977e')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}