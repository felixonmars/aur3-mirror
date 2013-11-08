pkgname=blender-smd
pkgver=1.9.2
pkgrel=1
pkgdesc="Source engine import/export for Blender"
arch=(any)
url="https://developer.valvesoftware.com/wiki/Blender_SMD_Tools"
license=("GPL v2")
source=("https://blender-smd.googlecode.com/files/io_smd_tools-$pkgver.zip")
depends=("blender>=9:2.68")
makedepends=(dos2unix python)
sha1sums=('280d947efc0f69f5021b26009122eef1e7a57c0a')

_blender_version=`blender -v | grep "Blender\s" | awk '{print $2}'`

build() {
	cd "$srcdir"
	find . -type f -exec dos2unix {} \;
}
package() {
	cd "$srcdir"
	find . -name '*.py' -exec install -Dm755 {} "$pkgdir/usr/share/blender/${_blender_version}/scripts/addons/"{} \;
	python -m compileall "$pkgdir/usr/share/blender"
}
