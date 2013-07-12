# Maintainer: Daniele Paolella <danielepaolella@email.it>
pkgname=douml
pkgver=1.07b4
pkgrel=2
pkgdesc="UML diagram editor, fork of Bouml 4.22"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/douml/"
license=('GPL3' 'MIT' 'BSD')
depends=('qt4' 'boost' 'perl-file-fcntllock')
changelog=$pkgname.changelog
source=(https://github.com/DoUML/douml/archive/$pkgver.tar.gz
	$pkgname-$pkgver.patch)
md5sums=('d276f967562f034503417d9c2c472c92'
         'dae01ce1011d1387a82252bb34d9e921')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m 644 "licenses/MITlicense.txt" "$pkgdir/usr/share/licenses/$pkgname"
	install -m 644 "licenses/QsLogLicense.txt" "$pkgdir/usr/share/licenses/$pkgname"
}
