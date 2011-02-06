# Maintainer: Mark Pustjens <pustjens@dds.nl

pkgname=x-kit
pkgver=0.4.2.2
pkgrel=1
pkgdesc="A simple, transparent and easy to extend xorg parser."
url="http://launchpad.net/xorgparser"
arch=('any')
license=('GPL')
source=("http://launchpad.net/xorgparser/trunk/0.4.2/+download/${pkgname}-${pkgver}.tar.gz")
depends=()

build() {
	cd ${srcdir}/xorgparser/
	python setup.py build --build-base=${srcdir}/build/
}

package () {
	cd ${srcdir}/xorgparser/
	python setup.py install --root=${pkgdir} \
		--install-purelib=/usr/lib/python2.6/site-packages/ --no-compile
}

md5sums=('8ea51640362d13d304b405aba0b49275')
