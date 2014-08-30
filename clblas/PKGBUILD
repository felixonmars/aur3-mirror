# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=clblas
pkgver=2.2
pkgrel=1
pkgdesc="A software library containing BLAS functions written in OpenCL"
arch=("i686" "x86_64")
url="https://github.com/clMathLibraries/clBLAS"
license=('APACHE')
builddepends=("amdapp-sdk" "acml-gfortran" "boost")
depends=("amdapp-sdk")

source=("https://github.com/clMathLibraries/clBLAS/archive/v${pkgver}.zip")
md5sums=('a3cd1a8099cf8648e568d2e1c6d3e4a0')
sha512sums=('d8fb7a5ea756816b70a97085ae2d1ab07721cc292897e8283c2c962fa95c13b7393f7302d05bd9e517097b713deb6937003b98563c2785fc72b521b6dafa95bf')

if [ "$CARCH" == "x86_64" ]; then
    _bits=64
elif [ "$CARCH" == "i686" ]; then
    _bits=32
fi

build() {
	export DESTDIR="${pkgdir}"
	cd "${srcdir}/clBLAS-${pkgver}/src"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ./
	make clBLAS
}

package() {
	cd "${srcdir}/clBLAS-${pkgver}/src"
	make install
	rm -rf "${pkgdir}/usr/bin${_bits}"
	mv "${pkgdir}/usr/lib${_bits}" "${pkgdir}/usr/lib"
	mkdir "${pkgdir}/usr/include/clBLAS/"
	mv -t "${pkgdir}/usr/include/clBLAS/" "${pkgdir}"/usr/include/*.h
}
