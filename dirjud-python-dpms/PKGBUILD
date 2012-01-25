pkgname=dirjud-python-dpms
pkgver=688e645
pkgrel=1
pkgdesc="Python Bindings to DPMS X11 extension"
arch=('any')
url="https://github.com/dirjud/python-dpms"
license=("UNKNOW")
depends=('python2')
source=(https://github.com/dirjud/python-dpms/zipball/master/${pkgname}-${pkgver}.zip)
md5sums=('34c3ffa3538d14beb40c4f96aa500b36')

build() {
	:
}

package() {
	cd $srcdir/${pkgname}-${pkgver}
	python2 setup.py install --root=$pkgdir
}
