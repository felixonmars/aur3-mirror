_name=ucnum
pkgname="python-$_name"
pkgver=1.0
pkgrel=3
pkgdesc='Unicode helper and search utility'
arch=('any')
url="http://github.com/flying-sheep/$_name"
license=('GPLv3')
depends=('python')
source=("https://pypi.python.org/packages/source/u/$_name/$_name-$pkgver.tar.gz")
md5sums=('ebbd0b58ba63a0bfd0143c0de74c4b9b')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}