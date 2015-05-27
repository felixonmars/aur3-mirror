pkgname=('python-subunit' 'python2-subunit')
pkgver=1.1.0
pkgrel=1
pkgdesc="Subunit is a streaming protocol for test results."
arch=('any')
depends=()
url="https://launchpad.net/subunit"
license=('Apache License')
source=(https://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=(d2c09c93346077ced675c9f718e6a0f1)

package_python-subunit() {
        depends=('python' 'python-extras' 'python-testtools')
	cd ${srcdir}/${pkgbase}-${pkgver}
	python setup.py install --prefix=/usr --root=${pkgdir}
}

package_python2-subunit() {
        depends=('python2' 'python2-extras' 'python2-testtools')
	cd ${srcdir}/${pkgbase}-${pkgver}
	python2 setup.py install --prefix=/usr --root=${pkgdir}
	# We only install the exec files with the python3 version
	rm ${pkgdir}/usr/bin -r
}
