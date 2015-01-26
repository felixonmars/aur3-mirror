# Maintainer: Fabio Comuni <fabrix.xm@gmail.com>
pkgname=confclerk
pkgver=0.6.1
pkgrel=1
pkgdesc="ConfClerk is an application written in ​Qt, which makes conference schedules available offline."
arch=('i686' 'x86_64')
url="http://www.toastfreeware.priv.at/confclerk"
groups=('utility')
license=('GPL')
depends=('qt4')
source=("http://www.toastfreeware.priv.at/tarballs/confclerk/$pkgname-$pkgver.tar.gz")
md5sums=('b55c471e00b90b4b9b9c1447e4eaf71b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	qmake-qt4
	make
}

package() {
	install -m 755 -p -D "$srcdir/$pkgname-$pkgver/src/bin/confclerk" "$pkgdir/usr/bin/confclerk"
	mkdir -p "$pkgdir/usr/share/applications/"
	desktop-file-install --dir="$pkgdir/usr/share/applications/" "$srcdir/$pkgname-$pkgver/data/confclerk.desktop"
	
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/"
	cp "$srcdir/$pkgname-$pkgver/data/confclerk.svg" "$pkgdir/usr/share/icons/hicolor/scalable/"
}



