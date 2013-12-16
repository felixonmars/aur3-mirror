# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=girlook
pkgver=0.1.2
pkgrel=1
pkgdesc="GObject GIR file inspector"
arch=('any')
url="http://sourceforge.net/projects/girlook/"
license=('GPL3')
depends=('python2-lxml' 'python2-gobject')
makedepends=('python2-setuptools')
source=("http://downloads.sourceforge.net/girlook/$pkgname-$pkgver.tar.bz2")
md5sums=('cffc4b1ee4a7fb4cfe61c145e84ee7a8')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	find . -name "*.py" | xargs sed -i "s|/usr/bin/python|/usr/bin/python2|g"
	sed -i "s|/usr/bin/python|/usr/bin/python2|g" scripts/girlook
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir"
}
