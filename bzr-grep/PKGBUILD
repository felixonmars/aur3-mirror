# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=bzr-grep
pkgver=0.4.0
pkgrel=1
pkgdesc="Bazaar plugin to grep files"
arch=('any')
url="https://launchpad.net/bzr-grep/"
license=('GPL')
depends=("python2" "bzr")
source=("http://launchpad.net/${pkgname}/trunk/${pkgver}-final/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=('90a71ed4017d091fa91fd4ee8caf62a8')

build() {
	:
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	python2 ./setup.py install --prefix=/usr --root "${pkgdir}"
}

