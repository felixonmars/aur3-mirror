pkgname=pymeshio
pkgver=2.7.8
pkgrel=1
pkgdesc="pymeshio is a package for 3d model io. create for blender import/expoert plugin backend."
arch=(any)
url="https://pypi.python.org/pypi/pymeshio"
license=("zlib")
source=("https://pypi.python.org/packages/source/p/pymeshio/pymeshio-$pkgver.zip")
depends=(python2-setuptools)
makedepends=(blender dos2unix python)
optdepends=("blender: import/export plugin")
md5sums=('7ab35df25f30a1fadbc4f6485ac8d6e5')

_blender_version=`blender -v | grep "Blender\s" | awk '{print $2}'`

prepare() {
	cd "$srcdir"
	find . -type f -exec dos2unix {} \;
}

package() {
	cd "$srcdir/pymeshio-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
	cd blender26-meshio
	find . -name '*.py' -exec install -Dm755 {} "$pkgdir/usr/share/blender/${_blender_version}/scripts/addons/meshio/"{} \;
	python -m compileall "$pkgdir/usr/share/blender"
}
