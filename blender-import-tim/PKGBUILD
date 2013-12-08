pkgname=blender-import-tim
pkgver=1.0.0
pkgrel=1
pkgdesc="Import PSone Texture Images .TIM."
arch=(any)
url="http://wiki.blender.org/index.php/User:Koilz/13.04.15_Import_TIM"
license=("GPL")
source=("http://projects.blender.org/tracker/download.php/153/467/34994/24820/import_TIM.py")
depends=("blender>=7:2.66a")
makedepends=(dos2unix python)
md5sums=('abca668735bfa7e282a328fc8f4a18e8')

_blender_version=`blender -v | grep "Blender\s" | awk '{print $2}'`

prepare() {
	cd "$srcdir"
	find . -type f -exec dos2unix {} \;
}
package() {
	cd "$srcdir"
	find . -name '*.py' -exec install -Dm755 {} "$pkgdir/usr/share/blender/${_blender_version}/scripts/addons/"{} \;
	python -m compileall "$pkgdir/usr/share/blender"
}
