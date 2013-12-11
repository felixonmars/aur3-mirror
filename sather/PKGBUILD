# Submitter: perlawk

pkgname=sather
pkgver=1.2.3
pkgrel=1
pkgdesc="Sather is an object oriented language designed to be simple, efficient, safe, flexible and non-proprietary."
url="http://www1.icsi.berkeley.edu/~sather/"
license=("PerlArtistic" "LGPL")
arch=("i686" "x86_64")
depends=('gc')
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
options=(!strip)

build() {
  builddir="${srcdir}"/${pkgname}-${pkgver}/
	config=${builddir}/System/Common/CONFIG
	cd ${builddir}
	export SATHER_HOME="${builddir}/"
	sed -i 's!1.2b!1.2.3!; ' ${builddir}/System/Common/CONFIG.proto
	sed -i 's!CPP=/lib/cpp -C -P!CPP=/usr/bin/cpp -C -P!g' Makefile
	make common
	echo 'UID:"";' > .config
	sed -n '/^PLATFORM/p' ${config} >>  .config
	sed -e '1,/^PLATFORM/d' ${config} >>  .config
	cp .config ${config} 
	make -j8
	#make gui
	sed -i 's/interpreter->result/Tcl_GetStringResult(interpreter)/g;' Library/System/TclTk/c_interface.c
	sed -i 's/interp->result/Tcl_GetStringResult(interp)/g; s/#include <stdio.h>/#include <stdio.h>\n#include <stdlib.h>\n/; s/Tcl_GetStringResult(interp) = Tk_PathName(RasterPtr->tkwin);/Tcl_SetResult(interp, Tk_PathName(RasterPtr->tkwin), TCL_DYNAMIC);/g;' Library/System/TclTk/tkRaster.c
	make browser
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
	mkdir -p "${pkgdir}"/usr/bin
	mkdir -p "${pkgdir}"/usr/lib/sather/
	mkdir -p "${pkgdir}"/usr/share/doc/

	cd Bin
	install -m755 PP sabrowse sacomp saprep gen_html "${pkgdir}"/usr/bin 

	cd ..
	cp -a *Library/ System/ Browser/ "${pkgdir}"/usr/lib/sather/ 
	chmod -R a+rx "${pkgdir}"/usr/lib/sather/

	cp -a Doc/man/ "${pkgdir}"/usr/share/doc/
	chmod -R a+rx "${pkgdir}"/usr/share/doc/

}
md5sums=('3fc58d9644f3993d4fc6afd9cf03d990')
