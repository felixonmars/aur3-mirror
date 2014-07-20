# Submitter: Jianjun Mao <justmao945@gmail.com>
# Maintainer: <lulker@chome.ws>
pkgname=luvit
pkgver=0.8.2
pkgrel=1
pkgdesc="An attempt to do something crazy by combining node.js' platform layer, libuv, with Luajit."
arch=('i686' 'x86_64')
options=('!buildflags')
url="http://luvit.io/"
license=('APACHE')
source=("http://luvit.io/dist/latest/luvit.tar.gz")
md5sums=('26f030c8d521ebece84bf27163d6f668')
build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}
package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}
