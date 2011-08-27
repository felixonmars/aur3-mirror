# Contributor: John Gerritse <reaphsharc@gmail.com>
pkgname=wwmkr
pkgver=2.0.2
pkgrel=1
pkgdesc="A novel building tool for fiction writers"
arch=('i686' 'x86_64')
url="http://www.wwmkr.com/"
license=('GPL')
depends=('gambas2')
source=(http://www.wwmkr.com/uploads/$pkgname-2.0-autotools.tar.gz $pkgname.desktop)
md5sums=('fcf84497c7bdacfaf9a0b8cc15bd322f' '08dfeedc859a3306feb34f45fd202b76')

build() {
cd "$srcdir/$pkgname-$pkgver"
./configure --prefix=/usr || return 1
make || return 1
install -Dm755 $pkgname/$pkgname.gambas $pkgdir/usr/bin/$pkgname
install -Dm644 $pkgname/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
