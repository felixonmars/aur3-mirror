# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-pycrypto
_pkgname=pycrypto
pkgver=2.4.1
pkgrel=1
pkgdesc="Various cryptographic modules for the Python programming language"
arch=('i686' 'x86_64')
depends=('python26')
url="http://www.dlitz.net/software/pycrypto"
license=('custom')
source=("http://ftp.dlitz.net/pub/dlitz/crypto/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('c2a1404a848797fb0806f3e11c29ef15')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python26 setup.py build
	python26 setup.py install --root="$pkgdir" --optimize=1

	install -Dm 644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
	cp -r LEGAL "$pkgdir/usr/share/licenses/$pkgname/"
}
