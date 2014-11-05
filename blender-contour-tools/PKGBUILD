pkgname=blender-contour-tools
pkgver=1.2.1
pkgrel=1
pkgdesc="Contour retopology tools for Blender"
arch=(any)
url="http://cgcookie.com/blender/docs/contour-retopology"
license=("GPL v2")
source=("https://github.com/CGCookie/retopology/archive/$pkgver.tar.gz")
depends=("blender>=14:2.71")
makedepends=(dos2unix python)
md5sums=('dc8966ab5b042e07868435f5095ac7da')

_blender_version=`blender -v | grep "Blender\s" | awk '{print $2}'`

package() {
	cd "$srcdir/retopology-contours-$pkgver"
	find . -name '*.py' -exec install -Dm755 {} "$pkgdir/usr/share/blender/${_blender_version}/scripts/addons/retopology-contours/"{} \;
	install -Dm644 license.txt "$pkgdir/usr/share/licenses/blender-contour-tools/license.txt"
	python -m compileall "$pkgdir/usr/share/blender"
}
