# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_projectname=keyczar
_pkgname=$_projectname-python
pkgname=python2-$_pkgname
_pkgver=0.71d-09062013
pkgver=${_pkgver//-/+}
pkgrel=1
pkgdesc="An open source cryptographic toolkit designed to make it easier and safer for developers to use cryptography in their applications."
arch=("any")
url="https://code.google.com/p/keyczar/"
license=("APACHE")
depends=("python2-crypto" "python2-pyasn1")
source=("http://$_projectname.googlecode.com/files/$_pkgname-$_pkgver.tar.gz")
sha256sums=("88a61ac7f7be788fea9f6592abda12ee755eb7b4e38dfa841c378b396fdb0da1")

build() {
	cd "$srcdir/$_pkgname"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
