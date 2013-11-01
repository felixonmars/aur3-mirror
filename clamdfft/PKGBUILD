# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=clamdfft
pkgver=1.10.321
pkgrel=1
pkgdesc="AMD Accelerated Parallel Processing FFT Library (OpenCL)"
arch=("i686" "x86_64")
url="http://developer.amd.com/tools-and-sdks/heterogeneous-computing/amd-accelerated-parallel-processing-math-libraries/"
license=(custom)
depends=("amdapp-sdk")

source=("http://developer.amd.com/wordpress/media/download.php?f=Y2xBbWRGZnQtMS4xMC4zMjEudGFyLmd6")
md5sums=('f2b08c34a72719546ab290428e79e2b9')
sha512sums=('779dfd49f49916a0e6c71c26d54e484b9e6aa986bb64d92b397e1cda4fc54476f4913b1a0322ae2a5e5292250b79827537050a16f8450d9b0d9b424b011f30b4')

build() {
	mkdir "${srcdir}"/clamdfft
	gzip -dc "${srcdir}"/clAmdFft-${pkgver}-Linux.tar.gz | tar oxvf - -C "${srcdir}"/clamdfft
}

package(){

	mkdir -p $pkgdir/usr/share/licenses/clamdfft
	mkdir -p $pkgdir/usr/include
	mkdir -p $pkgdir/usr/lib
	mkdir -p $pkgdir/opt/clamdfft/bin
	mkdir -p $pkgdir/opt/clamdfft/doc
	mkdir -p $pkgdir/opt/clamdfft/samples

	if test "$CARCH" == x86_64; then
          cp -P "${srcdir}"/clamdfft/bin64/*		"${pkgdir}"/opt/clamdfft/bin
          cp -P "${srcdir}"/clamdfft/lib64/*		"${pkgdir}"/usr/lib/
	fi

	if test "$CARCH" == i686; then
	  cp -P "${srcdir}"/clamdfft/bin32/*		"${pkgdir}"/opt/clamdfft/bin
	  cp -P "${srcdir}"/clamdfft/lib32/*		"${pkgdir}"/usr/lib/
	fi

	cp "${srcdir}"/clamdfft/doc/*			"${pkgdir}"/opt/clamdfft/doc
	cp "${srcdir}"/clamdfft/include/*		"${pkgdir}"/usr/include/
	cp "${srcdir}"/clamdfft/samples/*		"${pkgdir}"/opt/clamdfft/samples/
	cp "${srcdir}"/clAmdFft-README.txt		"${pkgdir}"/opt/clamdfft/

	install -D -m644 "${srcdir}"/clAmdFft-EULA.txt	"${pkgdir}"/usr/share/licenses/clamdfft/LICENSE
}
