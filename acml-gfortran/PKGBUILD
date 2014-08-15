# Maintainer: cornholio <vigo.the.unholy.carpathian@gmail.com>

# You MUST manually download acml-${pkgver}-gfortran-64bit.tgz from here: http://developer.amd.com/tools-and-sdks/cpu-development/amd-core-math-library-acml/acml-downloads-resources/
# I recommend downloading it to the directory specified by SRCDEST in /etc/makepkg.conf
pkgname=acml-gfortran
pkgver=6.0.5.7
pkgrel=1
pkgdesc="AMD Core Math Library (ACML) for Linux built with GFORTRAN"
arch=("x86_64")
url="http://developer.amd.com"
license=(custom)
depends=("gcc-libs" "gcc-fortran" "bash" "tcsh" "libcl")
options=('staticlibs')
source=("http://developer.amd.com/tools-and-sdks/cpu-development/amd-core-math-library-acml/acml-downloads-resources/acml-${pkgver}-gfortran64.tgz")
sha1sums=('35d4481760f8366c4d544a24add8017baca6a955')

build() {	

	cd ${srcdir}/gfortran64/examples
	make

	cd ${srcdir}/gfortran64_mp/examples
	make

}
package(){

	mkdir -p $pkgdir/usr/share/licenses/acml-gfortran
	mkdir -p $pkgdir/usr/include/acml/gfortran
	mkdir -p $pkgdir/usr/lib/acml/gfortran
	mkdir -p $pkgdir/opt/acml/gfortran

	cp ${srcdir}/gfortran64/include/*		${pkgdir}/usr/include/acml/gfortran/
	cp -r ${srcdir}/gfortran64/lib/*			${pkgdir}/usr/lib/acml/gfortran/
	cp -r ${srcdir}/gfortran64_mp/lib/*		${pkgdir}/usr/lib/acml/gfortran/

	cp -r ${srcdir}/gfortran64/examples		${pkgdir}/opt/acml/gfortran/examples
	cp -r ${srcdir}/gfortran64_mp/examples		${pkgdir}/opt/acml/gfortran/examples_mp

	cp -r ${srcdir}/Doc 					${pkgdir}/opt/acml/gfortran/
	cp -r ${srcdir}/util					${pkgdir}/opt/acml/gfortran/
	cp ${srcdir}/ReleaseNotes				${pkgdir}/opt/acml/gfortran/
	install -D -m644 ${srcdir}/ACML-EULA.txt		${pkgdir}/usr/share/licenses/acml-gfortran/LICENSE
	find "$pkgdir/opt/acml/" -type f -exec chmod 644 {} \;
        find "$pkgdir/opt/acml/" -type d -exec chmod 755 {} \;
	chown -R root:root "$pkgdir"

}
