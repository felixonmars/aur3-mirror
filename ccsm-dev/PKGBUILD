# WTF release naming scheme FTW
pkgname=ccsm-dev
pkgseries=0.9.5
pkgver=${pkgseries}.92
pkgrel=1
pkgdesc="CompizConfig Settings Manager in Python"
arch=('any')
url="http://compiz.org"
install="ccsm-dev.install"
license=('GPL')
provides=('ccsm')
conflicts=('ccsm')
depends=('compizconfig-python-dev' 'pygtk')
optdepends=('xorg-xprop: grab various window properties for use in window matching rules')
source=("https://launchpad.net/compiz-ccsm/${pkgseries}/${pkgver}/+download/ccsm-${pkgver}.tar.bz2")
md5sums=('eb55c19d34d70d7d1df064a6359b012c')

build() {
	cd "ccsm-${pkgver}"
	python2 setup.py build --prefix="/usr"
}

package() {
	cd "ccsm-${pkgver}"
	python2 setup.py install --prefix="/usr" --root="${pkgdir}"
}
