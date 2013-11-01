# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=clamdblas
pkgver=1.10.321
pkgrel=1
pkgdesc="AMD Accelerated Parallel Processing BLAS Library (OpenCL)"
arch=("i686" "x86_64")
url="http://developer.amd.com/tools-and-sdks/heterogeneous-computing/amd-accelerated-parallel-processing-math-libraries/"
license=(custom)
depends=("amdapp-sdk")

source=("http://developer.amd.com/wordpress/media/download.php?f=Y2xBbWRCbGFzLTEuMTAuMzIxLnRhci5neg==")
md5sums=('41a203355cb63097748a6d93518977b4')
sha512sums=('df412498bf2938dcba43adf4952ce7bd32f3e24d9f9ca7e00a66ae99ddc7c71d737171579b7788e79ece44972d504619411509e9f5404f58f491b69622db7461')

build() {
	mkdir "${srcdir}"/clamdblas
	gzip -dc "${srcdir}"/clAmdBlas-${pkgver}-Linux.tar.gz | tar oxvf - -C "${srcdir}"/clamdblas
}

package(){

	mkdir -p $pkgdir/usr/share/licenses/clamdblas
	mkdir -p $pkgdir/usr/include
	mkdir -p $pkgdir/usr/lib
	mkdir -p $pkgdir/opt/clamdblas/bin
	mkdir -p $pkgdir/opt/clamdblas/doc
	mkdir -p $pkgdir/opt/clamdblas/samples

	if test "$CARCH" == x86_64; then
          cp "${srcdir}"/clamdblas/bin64/*		"${pkgdir}"/opt/clamdblas/bin
          cp -P "${srcdir}"/clamdblas/lib64/*		"${pkgdir}"/usr/lib/
	fi

	if test "$CARCH" == i686; then
	  cp "${srcdir}"/clamdblas/bin32/*		"${pkgdir}"/opt/clamdblas/bin
	  cp -P "${srcdir}"/clamdblas/lib32/*		"${pkgdir}"/usr/lib/
	fi

	cp "${srcdir}"/clamdblas/doc/*			"${pkgdir}"/opt/clamdblas/doc
	cp "${srcdir}"/clamdblas/include/*		"${pkgdir}"/usr/include/
	cp "${srcdir}"/clamdblas/samples/*		"${pkgdir}"/opt/clamdblas/samples/
	cp "${srcdir}"/clAmdBlas-README.txt		"${pkgdir}"/opt/clamdblas/

	install -D -m644 "${srcdir}"/clAmdBlas-EULA.txt	"${pkgdir}"/usr/share/licenses/clamdblas/LICENSE
}
