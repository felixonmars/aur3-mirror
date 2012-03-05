# WTF release naming scheme FTW
pkgname=compizconfig-python-dev
pkgseries=0.9.5
pkgver=${pkgseries}.92
pkgrel=1
pkgdesc="Compizconfig bindings for python"
arch=('i686' 'x86_64')
url="http://compiz.org"
license=('GPL')
provides=('compizconfig-python')
conflicts=('compizconfig-python')
depends=('compiz-core-dev' 'libcompizconfig-dev' 'glib2' 'python2')
makedepends=('intltool' 'pkgconfig' 'cython2')
source=("https://launchpad.net/compiz-compizconfig-python/${pkgseries}/${pkgver}/+download/compizconfig-python-${pkgver}.tar.bz2")
md5sums=('95e42a55714a0743a32478bc56b18973')

build() {
	cd "compizconfig-python-${pkgver}"
	python2 setup.py build
}

package() {
    cd "compizconfig-python-${pkgver}"
    python2 setup.py install --prefix="/usr" --root="$pkgdir"
}
