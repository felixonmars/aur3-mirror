# Contributer: Jason Chu <jchu@xentac.net>

pkgname=spicctrl
pkgver=1.9
pkgrel=2
pkgdesc="Spic control"
arch=(i686 x86_64)
url="http://popies.net/sonypi/"
license=('GPLv2')
depends=('glibc')
source=(http://popies.net/sonypi/$pkgname-$pkgver.tar.bz2)
md5sums=('775a1959c03e59830303b8320ca379d2')


build() {
   cd $pkgname-$pkgver
   make
}

package() {
   install -D $pkgname-$pkgver/$pkgname $pkgdir/usr/bin/$pkgname
}