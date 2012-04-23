# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-sip
_pkgname=sip
pkgver=4.13.2
pkgrel=1
pkgdesc="A tool that makes it easy to create Python2 bindings for C and C++ libraries"
arch=('i686' 'x86_64')
url="http://www.riverbankcomputing.com/software/sip"
license=('custom:"sip"')
depends=('sip' 'python26')
source=("http://www.riverbankcomputing.com/static/Downloads/sip4/$_pkgname-$pkgver.tar.gz")
md5sums=('5a12ea8e8a09b879ed2b3817e30fbc84')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python2.6 configure.py CFLAGS="$CFLAGS" LFLAGS="$LDFLAGS"
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm "$pkgdir/usr/bin/sip"
}
