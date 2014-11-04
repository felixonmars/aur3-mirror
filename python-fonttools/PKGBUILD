_name=fonttools
pkgname="python-$_name"
pkgver=2.5
pkgrel=4
conflicts=("$pkgname-git")
pkgdesc='Modify OpenType and TrueType fonts and convert them to and from XML'
arch=('any')
url="https://github.com/behdad/$_name"
license=('MIT')
depends=('python')
makedepends=('cython')
source=("https://github.com/behdad/$_name/archive/$pkgver.tar.gz")
sha1sums=('e972ed601602435b080ce79f129b441daefb2f75')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	
	mv "$pkgdir/usr/bin/ttx"{,3}
	mv "$pkgdir/usr/share/man/man1/ttx"{,3}.1
	install -Dm644 {,"$pkgdir/usr/share/licenses/$pkgname/"}LICENSE.txt
}

