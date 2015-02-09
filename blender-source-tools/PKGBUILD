pkgname=blender-source-tools
pkgver=2.4.0
pkgrel=1
pkgdesc="Source engine import/export for Blender"
arch=(any)
url="http://steamreview.org/BlenderSourceTools"
license=("GPL v2")
source=("blender_source_tools_$pkgver.zip::http://steamreview.org/BlenderSourceTools/download")
depends=("blender>=14:2.71")
makedepends=(dos2unix python unzip)
conflicts=(blender-smd)
provides=(blender-smd)
replaces=(blender-smd)
noextract=("blender_source_tools_$pkgver.zip")
sha1sums=('429a62fce62818be1da7b5afb83e3c0bc0c70b51')

_blender_version=`blender -v | grep "Blender\s" | awk '{print $2}'`

prepare() {
	cd "$srcdir"
	unzip blender_source_tools_$pkgver.zip
	find . -type f -exec dos2unix {} \;
}
package() {
	cd "$srcdir"
	find . -name '*.py' -exec install -Dm755 {} "$pkgdir/usr/share/blender/${_blender_version}/scripts/addons/"{} \;
	python -m compileall "$pkgdir/usr/share/blender"
}
