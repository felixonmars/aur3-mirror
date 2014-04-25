# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=Flask-Classy
pkgname=python-${_pkgname,,}
pkgver=0.6.10
pkgrel=1
pkgdesc="Class based views for Flask"
arch=("any")
url="https://github.com/apiguy/flask-classy"
license=("BSD")
depends=("python-flask")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("13c9b4312bff2bf5c6c45ba7d6da46d6bd81724dfc45b598f12438c230583aab")

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
