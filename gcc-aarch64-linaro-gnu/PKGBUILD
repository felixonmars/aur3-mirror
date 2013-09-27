# Maintainer: Ramkumar Ramachandra <artagnon@gmail.com>
# Check for new releases in: http://www.linaro.org/engineering/engineering-projects/armv8

pkgname=gcc-aarch64-linaro-gnu
pkgver=2013.09
pkgrel=1
pkgdesc="gcc gnu toolchain for building ARM64 kernel (maintained by Linaro)"
arch=('x86_64')
url="http://www.linaro.org/engineering/engineering-projects/armv8"
license=('GPL')
depends=('gcc-multilib' 'lib32-zlib')
optdepends=()
provides=()
options=(!strip)
install=
source=('gcc-linaro-aarch64-linux-gnu-2013.09.tar.xz::http://releases.linaro.org/13.09/components/toolchain/binaries/gcc-linaro-aarch64-linux-gnu-4.8-2013.09_linux.tar.xz')
md5sums=('d5cd341bf7f60aacc4d6be1a22a741d6')

package () {
	executables=('ar' 'as' 'c++' 'gcc' 'g++' 'ld' 'ld.bfd' 'nm' 'objcopy' 'objdump' 'ranlib' 'strip')
	mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
	mv "$srcdir/gcc-linaro-aarch64-linux-gnu-4.8-2013.09_linux" "$pkgdir/opt/gcc-aarch64-linaro-gnu"
	for i in "${executables[@]}"; do
		ln -s "/opt/gcc-aarch64-linaro-gnu/bin/aarch64-linux-gnu-${i}" "$pkgdir/usr/bin/aarch64-linux-gnu-${i}"
	done
}
