# Maintainer: Nicolas Stalder <nicolas.stalder@gmail.com>

pkgname=python2-iowait
pkgver=0.1
pkgrel=1
pkgdesc="Platform-independent module for I/O completion events"
url=("https://launchpad.net/python-iowait")
arch=('any')
license=('GPL')
depends=("python2")
source=("https://launchpad.net/python-iowait/0.1/0.1/+download/iowait-0.1.tar.gz")
md5sums=('f928f3c54cfa2c054e889abe936cd775')

build() {
	cd ${srcdir}/iowait-0.1

	python2 setup.py build || return 1
	python2 setup.py install --root=${pkgdir} || return 1

	# license
	install -Dm644 "${srcdir}/iowait-0.1/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
