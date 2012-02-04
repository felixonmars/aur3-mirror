# Maintainer: Karol Maciaszek <karol.maciaszek@gmail.com>
pkgname=fortune-mod-pl-twoja-stara
pkgver=0.1
pkgrel=1
pkgdesc="A set of lately popular jokes in PL"
url="http://kharg.czystybeton.pl" 
license="GPL" 
arch=(i686 x86_64)
depends=('fortune-mod')
makedepends=()
source=(http://kharg.czystybeton.pl/$pkgname-$pkgver.tar.gz)
md5sums=('db8143b4d264a50f8ab41aae9a491b4c')
build() {
	cd $startdir/src/$pkgname-$pkgver
	install -d $startdir/pkg/usr/share/fortune
	install -m 644 $startdir/src/$pkgname-$pkgver/twoja-stara $startdir/pkg/usr/share/fortune
	install -m 644 $startdir/src/$pkgname-$pkgver/twoja-stara.dat $startdir/pkg/usr/share/fortune
}

