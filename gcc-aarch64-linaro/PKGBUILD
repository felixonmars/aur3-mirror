# Maintainer: Ramkumar Ramachandra <artagnon@gmail.com>

pkgname=gcc-aarch64-linaro
pkgver=2014.03
pkgrel=2
pkgdesc="gcc toolchain for building ARM64 kernel (maintained by Linaro)"
arch=('x86_64')
url="http://www.linaro.org/projects/armv8/"
license=('GPL')
depends=('gcc-multilib' 'lib32-zlib')
optdepends=()
provides=()
options=(!strip staticlibs)
install=
source=("http://releases.linaro.org/latest/components/toolchain/binaries/gcc-linaro-aarch64-linux-gnu-4.8-${pkgver}_linux.tar.bz2")
md5sums=('940317fe2b7ea154f25f12556f23ee79')

package () {
	executables=('ar' 'as' 'c++' 'gcc' 'g++' 'ld' 'ld.bfd' 'nm' 'objcopy' 'objdump' 'ranlib' 'strip')
	mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
	mv "$srcdir/gcc-linaro-aarch64-linux-gnu-4.8-${pkgver}_linux" "$pkgdir/opt/${pkgname}"
	for i in "${executables[@]}"; do
		ln -s "/opt/${pkgname}/bin/aarch64-linux-gnu-${i}" "$pkgdir/usr/bin/aarch64-linux-gnu-${i}"
	done
}
