# Maintainer: blackleg <blackleg@openmailbox.org>

pkgname=blender-kerbal-git
pkgver=2366f39
pkgrel=1
pkgdesc="Blender addon for importing and exporting KSP .mu files."
arch=(any)
url="https://github.com/taniwha-qf/io_object_mu"
license=("GPL v2")
#source=("${pkgname}::git+https://github.com/taniwha-qf/io_object_mu.git")
source=("git+https://github.com/taniwha-qf/io_object_mu.git")
depends=("blender")
makedepends=(python)
md5sums=('SKIP')

_blender_version=`blender -v | grep "Blender\s" | awk '{print $2}'`

pkgver () {
  cd "${srcdir}/${pkgname}"
  git describe --always | sed 's|-|.|g'
}

package() {
	cd "$srcdir"
	find . -name '*.py' -exec install -Dm755 {} "$pkgdir/usr/share/blender/${_blender_version}/scripts/addons/"{} \;
	#python -m compileall "$pkgdir/usr/share/blender"
}
