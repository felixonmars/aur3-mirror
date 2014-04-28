# Maintainer: Qiaoyong Zhong <solary.sh@gmail.com>
pkgname=2048-qt
_pkgname=2048-Qt
pkgver=0.1.3 
pkgrel=1
pkgdesc="The 2048 number game implemented in Qt"
arch=('i686' 'x86_64')
url="https://github.com/xiaoyong/2048-Qt"
license=('MIT')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols' 'hicolor-icon-theme' 'desktop-file-utils' 'xdg-utils')
install=$pkgname.install
source=(https://github.com/xiaoyong/$_pkgname/archive/v$pkgver.tar.gz)
md5sums=('c50225bb2ae006f70b2b51a769074278')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	qmake $pkgname.pro
	make
}

check() {
	cd "$srcdir/$_pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 icons/scalable/apps/$pkgname.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
	install -D -m644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
