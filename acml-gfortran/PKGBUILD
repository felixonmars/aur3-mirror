# Maintainer: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=acml-gfortran
pkgver=5.1.0
pkgrel=2
pkgdesc="AMD Core Math Library (ACML) for Linux built with GFORTRAN"
arch=("x86_64")
url="http://developer.amd.com"
license=(custom)
depends=("gcc-libs-multilib" "bash" "tcsh")
makedepends=("sed")
md5sums=('9408a9093d24199e127b66e92623ecc1')

source=("http://download2-developer.amd.com/amd/ACML/acml-5-1-0-gfortran-64bit.tgz")

build() {
	mkdir ${srcdir}/acml
	gzip -dc ${srcdir}/contents-acml-5-1-0-gfortran-64bit.tgz | tar oxvf - -C ${srcdir}/acml
	
	_fma4_compat=`${srcdir}/acml/util/cpuid.exe | grep FMA4`
	if [[ "$_fma4_compat" == *not* ]]
	then
	_fma4=''
	else
	_fma4='_fma4'
	fi
	
	find ${srcdir}/acml/gfortran64${_fma4}/examples -type f -exec sed -i "/ACMLDIR \(:*\)=/c ACMLDIR := ${srcdir}/acml/gfortran64${_fma4}/" {} \;
	find ${srcdir}/acml/gfortran64${_fma4}_mp/examples -type f -exec sed -i "/ACMLDIR \(:*\)=/c ACMLDIR := ${srcdir}/acml/gfortran64${_fma4}_mp/" {} \;
	find ${srcdir}/acml -type f -exec sed -i "/doplot \(:*\)=/c doplot := 0" {} \;

	cd ${srcdir}/acml/gfortran64${_fma4}/examples
	make
	cd ${srcdir}/acml/gfortran64${_fma4}/examples/performance
	make

	cd ${srcdir}/acml/gfortran64${_fma4}_mp/examples
	make
	cd ${srcdir}/acml/gfortran64${_fma4}_mp/examples/performance
	make

	find ${srcdir}/acml -type f -exec sed -i "/doplot \(:*\)=/c doplot := 1" {} \;
	find ${srcdir}/acml -type f -exec sed -i "/ACMLDIR \(:*\)=/c ACMLDIR := /usr" {} \;
	find ${srcdir}/acml -type f -exec sed -i 's^$(ACMLDIR)/lib^$(ACMLDIR)/lib/acml^g' {} \;
	find ${srcdir}/acml -type f -exec sed -i 's^$(ACMLDIR)/include^$(ACMLDIR)/include/acml^g' {} \;
}
package(){

	mkdir -p $pkgdir/usr/share/licenses/acml
	mkdir -p $pkgdir/usr/include/acml
	mkdir -p $pkgdir/usr/lib/acml
	mkdir -p $pkgdir/opt/acml

	cp ${srcdir}/acml/gfortran64${_fma4}/include/*		${pkgdir}/usr/include/acml/
	cp ${srcdir}/acml/gfortran64${_fma4}/lib/*		${pkgdir}/usr/lib/acml/
	cp ${srcdir}/acml/gfortran64${_fma4}_mp/lib/*		${pkgdir}/usr/lib/acml/

	cp -r ${srcdir}/acml/gfortran64${_fma4}/examples	${pkgdir}/opt/acml/examples
	cp -r ${srcdir}/acml/gfortran64${_fma4}_mp/examples	${pkgdir}/opt/acml/examples_mp

	cp -r ${srcdir}/acml/Doc 				${pkgdir}/opt/acml/
	cp -r ${srcdir}/acml/util				${pkgdir}/opt/acml/
	cp ${srcdir}/acml/ReleaseNotes				${pkgdir}/opt/acml/
	install -D -m644 ${srcdir}/acml/ACML-EULA.txt		${pkgdir}/usr/share/licenses/acml/LICENSE
	find "$pkgdir/opt/acml/" -type f -exec chmod 644 {} \;
        find "$pkgdir/opt/acml/" -type d -exec chmod 755 {} \;
	chown -R root:root "$pkgdir"

}
