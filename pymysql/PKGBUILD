# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# changed for Python3 by David Madl <david@madlnet.net>

pkgname=pymysql
pkgver=0.5
pkgrel=2
pkgdesc="Pure Python MySQL Client"
arch=(any)
url="http://www.pymysql.org/"
license=('BSD')
depends=('python')
makedepends=('python-distribute')
source=("http://pypi.python.org/packages/source/P/PyMySQL/PyMySQL-$pkgver.tar.gz" LICENSE setup.py.py3k.patch build-py3k.sh)

build() {
	cp "$srcdir/"{setup.py.py3k.patch,build-py3k.sh} "PyMySQL-$pkgver"
	cd "$srcdir/PyMySQL-$pkgver"
	./build-py3k.sh
	cd py3k
	python setup.py install --root="$pkgdir" --prefix=/usr
	install -Dm0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


md5sums=('125e8a3449e05afcb04874a19673426b'
         'c4667d5973931f7f10e60889c2365ba7'
         '2c8433bf8504bfd64af1fd8023ad536e'
         '3f07eef5fdc49efba3afa590ed72658b')
