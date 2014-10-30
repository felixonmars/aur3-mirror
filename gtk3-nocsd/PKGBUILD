# Maintainer: Natrio <natrio at list dot ru>
pkgname=gtk3-nocsd
pkgver=20140823
pkgrel=2
pkgdesc="A hack to disable gtk+ 3 client side decoration"
arch=('i686' 'x86_64')
url="https://github.com/PCMan/${pkgname}"
license=('GPL2')
depends=('gtk3')
makedepends=('gtk3')
source=("git+https://github.com/PCMan/${pkgname}.git")
md5sums=('SKIP')
install="${pkgname}.install"

build() {
 cd "$srcdir/$pkgname"
 ./build.sh
}

package() {
 cd "$srcdir/$pkgname"
 install -Dm755 "$pkgname.so" "$pkgdir/usr/lib/$pkgname.so"
 install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
