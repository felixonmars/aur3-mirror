pkgname=blender-xnalaramesh
pkgver=1.3.2
pkgrel=1
pkgdesc="Blender addon Import/Export XPS Models, Poses"
arch=(any)
url="http://johnzero7.deviantart.com/journal/Blender-2-7-XPS-Tools-475948475"
license=("public domain")
source=("https://github.com/johnzero7/xps_tools/archive/v$pkgver.tar.gz")
depends=("blender>=13:2.70")
makedepends=(python)
sha1sums=('41888496049eacb7d22ea144e0d00b1ecb148e33')

_blender_version=`blender -v | grep "Blender\s" | awk '{print $2}'`

prepare() {
	cd "$srcdir/xps_tools-$pkgver/XNALaraMesh"
	rm -r test
}
package() {
	cd "$srcdir/xps_tools-$pkgver/XNALaraMesh"
	find . -name '*.py' -exec install -Dm755 {} "$pkgdir/usr/share/blender/${_blender_version}/scripts/addons/XNALaraMesh/"{} \;
	python -m compileall "$pkgdir/usr/share/blender"
}
