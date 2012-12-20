# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=manent
pkgver=0.91.0
pkgrel=1
pkgdesc="An algorithmically strong backup and archival program"
arch=("any")
url="http://code.google.com/p/manent/"
license=("custom")
depends=("python>=2.5" "pycrypto" "python2-paramiko")
options=(!emptydirs)
source=(http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2)

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}/src/

	python2 setup.py install --root="${pkgdir}"
}

sha1sums=('0482417f81220b278532fe942b0bfc90ea9c1866')
