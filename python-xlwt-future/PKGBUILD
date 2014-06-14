# Contributor: Vojtech Kral <vojtech NȮSPÅM @kral.hk>

pkgname=python-xlwt-future
pkgver=0.8.0
pkgrel=1
pkgdesc="Fork of python2-xlwt that supports both Python 3.3 and Python 2.6/2.7."
url='https://github.com/PythonCharmers/xlwt-future'
depends=('python' 'python-future')
source=("https://github.com/PythonCharmers/xlwt-future/archive/${pkgver}.tar.gz")
arch=('any')
license=('BSD')
sha256sums=('a1599dcfb03a2f9fe69a6abe4dba26ef1020f748f04e8e6856763b489c0392d0')


build()
{
	true
}

package()
{
	cd "${srcdir}/xlwt-future-$pkgver"
	python setup.py install --root=$pkgdir
}
