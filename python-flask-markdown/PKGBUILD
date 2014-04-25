# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=Flask-Markdown
pkgname=python-${_pkgname,,}
pkgver=0.3
pkgrel=1
pkgdesc="Markdown Jinja2 extension for Flask"
arch=("any")
url="https://pythonhosted.org/Flask-Markdown/"
license=("BSD")
depends=("python-flask" "python-markdown")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("d8c3f02545b395ad525b86760ad721a2c50efa3b8e602a8d486a1f47f68c6250")

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
