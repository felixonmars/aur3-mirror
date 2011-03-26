# Maintainer:  Matthew Bauer <mjbauer95@gmail.com>
pkgname=hatta
pkgver=1.3.3
pkgrel=3
pkgdesc="Hatta is a wiki engine – software that lets you run a wiki. It requires no configuration and can be easily started in any Mercurial repository."
arch=(any)
url="http://hatta-wiki.org/"
license=('GPL')
source=(http://hg.$pkgname-wiki.org/$pkgname/archive/$pkgver.zip)
depends=(python python-werkzeug mercurial)
makedepends=(setuptools mercurial)
md5sums=('b1c629480d29b6b2943e2cac079f7ec6')

build() {
	cd "$srcdir/Hatta-Wiki-$pkgver"
	python setup.py install --root="$pkgdir" || return 1
}
