# Daniel Kirchner <daniel at ekpyron dot org>
pkgname=mingw-w64-opencl-headers
pkgver=1.1.20110526
pkgrel=3
pkgdesc="OpenCL (Open Computing Language) header files (mingw-w64 symlinks)"
arch=('any')
license=('custom')
url='http://www.khronos.org/registry/cl/'
depends=('opencl-headers' 'mingw-w64-crt')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
	for _arch in ${_architectures}; do
		mkdir -p "${pkgdir}/usr/${_arch}/include"
		ln -s ../../../usr/include/CL "${pkgdir}/usr/${_arch}/include"
	done
}
