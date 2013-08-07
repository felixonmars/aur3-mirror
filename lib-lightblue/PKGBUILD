# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Gustavo Chain <g@0xff.cl>
# Contributor: kpj <kpjkpjkpjkpjkpjkpj@gmail.com>

# Maintainer: kpj <kpjkpjkpjkpjkpjkpj@gmail.com>
pkgname=lib-lightblue
_dwname=lightblue
pkgver=0.4
pkgrel=2
pkgdesc="LightBlue is a cross-platform Bluetooth API for Python which provides simple access to Bluetooth operations"
arch=('i686' 'x86_64')
url="http://lightblue.sourceforge.net/"
license=('GPL3')
depends=('python2' 'python2-pybluez' 'openobex')
source=(http://downloads.sourceforge.net/project/lightblue/lightblue/0.4/${_dwname}-${pkgver}.tar.gz)
md5sums=('2f2bf66faa4bf1a79eb28a47584077b7')

package() {
	cd ${srcdir}/${_dwname}-${pkgver}
	python2 setup.py install --root=${pkgdir}
}
