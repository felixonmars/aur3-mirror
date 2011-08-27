# Contributor: <nikron<at>nikron<d o t>net>

pkgname=python-shout
pkgver=0.2
pkgrel=1
pkgdesc="Python bindings for libshout"
arch=(i686)
url="http://www.icecast.com"
license=('LGPL')
depends=('libshout' 'python')
source=(http://downloads.us.xiph.org/releases/libshout/shout-python-$pkgver.tar.gz)
md5sums=('80bec97a1462c2d2a9282ba8a7c18336')

build() {
	cd "$startdir/src/shout-python-$pkgver"
	python setup.py install --root="$startdir/pkg/" || return 1
}
