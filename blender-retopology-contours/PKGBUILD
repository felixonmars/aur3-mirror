pkgname=blender-retopology-contours
pkgver=1.2.2
pkgrel=1
pkgdesc="Contour retopology tools for Blender"
arch=(any)
url="http://cgcookie.com/blender/docs/contour-retopology"
license=("GPL v2")
source=("https://github.com/CGCookie/retopology/archive/$pkgver.tar.gz")
depends=("blender>=14:2.71")
makedepends=(dos2unix python)
conflicts=(blender-contour-tools)
provides=(blender-contour-tools)
replaces=(blender-contour-tools)
md5sums=('1510373a01c11939d17ced11560234e1')

_blender_version=`blender -v | grep "Blender\s" | awk '{print $2}'`

package() {
	cd "$srcdir/retopology-contours-$pkgver"
	find . -name '*.py' -exec install -Dm755 {} "$pkgdir/usr/share/blender/${_blender_version}/scripts/addons/retopology-contours/"{} \;
	install -Dm644 license.txt "$pkgdir/usr/share/licenses/blender-contour-tools/license.txt"
	python -m compileall "$pkgdir/usr/share/blender"
}
