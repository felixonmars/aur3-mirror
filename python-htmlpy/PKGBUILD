# Maintainer: Koryabkin Ivan <apathism@gmail.com>

pkgname=python-htmlpy

pkgver=0.04
pkgrel=1

pkgdesc='A Python module to easily generate HTML tables and lists'
url='http://www.decalage.info/en/python/html'
license=('custom:CeCILL')

arch=('any')
depends=('python')

source=("http://please.googlecode.com/svn/third_party/HTML.py-${pkgver}.zip")
md5sums=('a5c61198b32ee2dc3a7df3c3714c6400')

build()
{
	cd "${srcdir}/HTML.py-${pkgver}/"
	python setup.py build
}

package()
{
	cd "${srcdir}/HTML.py-${pkgver}/"
	python setup.py install --root="${pkgdir}"

	install -D -m644 "Licence_CeCILL_V2-en.html" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}
