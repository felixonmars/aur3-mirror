pkgname=blender-meshlint
pkgver=1.0
pkgrel=2
pkgdesc="Blender Addon: MeshLint: Like a Spell-Checker for your Meshes."
arch=(any)
url="https://github.com/rking/meshlint"
license=("GPL")
source=("https://raw.github.com/rking/meshlint/master/meshlint.py")
depends=("blender>=5:2.65")
makedepends=(python)
md5sums=('4a8abe934936fc214fd1284c2f636027')

_blender_version=`blender -v | grep "Blender\s" | awk '{print $2}'`

package() {
	cd "$srcdir"
	find . -name '*.py' -exec install -Dm755 {} "$pkgdir/usr/share/blender/${_blender_version}/scripts/addons/"{} \;
	python -m compileall "$pkgdir/usr/share/blender"
}
