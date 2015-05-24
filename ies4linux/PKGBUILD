# Maintainer: Evan Penner <evaninrussia@gmail.com>

pkgname=ies4linux
pkgver=2.99.0.1
pkgrel=1
pkgdesc="The simpler way to run Microsoft Internet Explorer on Wine"
arch=(any)
url=http://www.tatanka.com.br/ies4linux/
license=(GPL)
depends=(cabextract pygtk wine)
options=(!emptydirs)
source=("http://www.tatanka.com.br/$pkgname/downloads/$pkgname-latest.tar.gz"
		'fix_winecreateprefix.patch'
		'wine_version.patch')
md5sums=(SKIP
	'e8d5fa236183c5c0e73bea199e086b7d'
	'ebe513efa7825bf03a6e42897fd0a168')

build() {
	cd "$srcdir"/$pkgname-$pkgver/

	patch -Np0 -i ../fix_winecreateprefix.patch
	patch -Np0 -i ../wine_version.patch

	# replace python with python2
	sed -i -e '/IES4LINUX=/s|`dirname "$0"`|/usr/lib/ies4linux|' -e 's/python -c/python2 -c/' $pkgname
	sed -i 's/python /python2 /' ui/pygtk/python-gtk.sh
}

package(){
	cd "$srcdir"

	install -Dm755 $pkgname-$pkgver/$pkgname "$pkgdir"/usr/bin/$pkgname
	rm $pkgname-$pkgver/$pkgname
	install -d "$pkgdir"/usr/lib/
	cp -a $pkgname-$pkgver "$pkgdir"/usr/lib/$pkgname
}
