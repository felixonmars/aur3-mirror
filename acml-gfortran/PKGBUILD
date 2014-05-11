# Maintainer: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=acml-gfortran
pkgver=5.3.1
pkgrel=3
pkgdesc="AMD Core Math Library (ACML) for Linux built with GFORTRAN"
arch=("x86_64")
url="http://developer.amd.com"
license=(custom)
depends=("gcc-libs" "gcc-fortran" "bash" "tcsh")
makedepends=("sed")
options=('staticlibs')
_source=("http://developer.amd.com/license-agreement-amd-core-math-library/?f=acml-5-3-1-gfortran-64bit.tgz")
sha1sums=('SKIP')
_sha1sums=('ec445af7944b6acdd1d692e5a1bf766395c0041e')

build() {

	# Get the webpage and needed extract variables
	curl -o index.html ${_source}
	_nonce=`grep "nonce" "${srcdir}/index.html" | awk '{print $5;}' | sed 's^value="^^g' | sed 's^"^^g'`
	_f=`grep "nonce" "${srcdir}/index.html" | awk '{print $14;}' | sed 's^value="^^g' | sed 's^"/>^^g'`

	# Request actual file using acquired variables
	curl -fLC - --retry 3 --retry-delay 3 -d amd_developer_central_nonce=${_nonce} \
		-d _wp_http_referer=/license-agreement-amd-core-math-library/?f=acml-5-3-1-gfortran-64bit.tgz \
		-d f=${_f} -o ${srcdir}/output.tgz ${_source}
	
	# Check hash
	if [ "`sha1sum ${srcdir}/output.tgz | awk '{print $1;}'`" != "$_sha1sums" ]; then
		echo "Hash does not match"
		return 1
	fi

	mkdir ${srcdir}/acml
	gzip -dc "${srcdir}/output.tgz" | tar oxvf - -C "${srcdir}/acml"
	gzip -dc "${srcdir}/acml/contents-acml-5-3-1-gfortran-64bit.tgz" | tar oxvf - -C "${srcdir}/acml"
	
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

	mkdir -p $pkgdir/usr/share/licenses/acml-gfortran
	mkdir -p $pkgdir/usr/include/acml/gfortran
	mkdir -p $pkgdir/usr/lib/acml/gfortran
	mkdir -p $pkgdir/opt/acml/gfortran

	cp ${srcdir}/acml/gfortran64${_fma4}/include/*		${pkgdir}/usr/include/acml/gfortran/
	cp ${srcdir}/acml/gfortran64${_fma4}/lib/*		${pkgdir}/usr/lib/acml/gfortran/
	cp ${srcdir}/acml/gfortran64${_fma4}_mp/lib/*		${pkgdir}/usr/lib/acml/gfortran/

	cp -r ${srcdir}/acml/gfortran64${_fma4}/examples	${pkgdir}/opt/acml/gfortran/examples
	cp -r ${srcdir}/acml/gfortran64${_fma4}_mp/examples	${pkgdir}/opt/acml/gfortran/examples_mp

	cp -r ${srcdir}/acml/Doc 				${pkgdir}/opt/acml/gfortran/
	cp -r ${srcdir}/acml/util				${pkgdir}/opt/acml/gfortran/
	cp ${srcdir}/acml/ReleaseNotes				${pkgdir}/opt/acml/gfortran/
	install -D -m644 ${srcdir}/acml/ACML-EULA.txt		${pkgdir}/usr/share/licenses/acml-gfortran/LICENSE
	find "$pkgdir/opt/acml/" -type f -exec chmod 644 {} \;
        find "$pkgdir/opt/acml/" -type d -exec chmod 755 {} \;
	chown -R root:root "$pkgdir"

}
