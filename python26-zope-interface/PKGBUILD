# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-zope-interface
_pkgname=zope-interface
pkgver=3.8.0
pkgrel=1
pkgdesc="Separate distribution of the zope.interface package used in Zope 3"
license=('ZPL')
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/zope.interface"
depends=('python26')
source=("http://pypi.python.org/packages/source/z/zope.interface/zope.interface-$pkgver.tar.gz")
md5sums=('8ab837320b4532774c9c89f030d2a389')

build() {
	cd "$srcdir/zope.interface-$pkgver"
	python26 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
