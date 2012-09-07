# Daniel Kirchner <daniel at ekpyron dot org>
pkgname=mingw-w64-oglp
pkgver=0.0
pkgrel=2
pkgdesc="OpenGL wrapper for C++. (mingw-w64 symlinks)"
arch=('any')
license=('GPL')
url="http://github.com/ekpyron/oglp/"
depends=('mingw-w64-glm' 'oglp' 'mingw-w64-crt')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
  for _arch in ${_architectures}; do
	mkdir -p ${pkgdir}/usr/${_arch}/include
	ln -s ../../../usr/include/oglp "${pkgdir}/usr/${_arch}/include"
  done
}
