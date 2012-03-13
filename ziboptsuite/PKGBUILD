# Maintainer: Johannes Schlatow <johannes.schlatow@googlemail.com>
# Contributor: Stephan Friedrichs <deduktionstheorem@googlemail.com>

pkgname='ziboptsuite'
pkgver='2.1.1'
pkgrel=2
pkgdesc='The ZIB Optimization Suite is a tool for generating and solving mixed integer programs. Consists of ZIMPL, SoPlex and SCIP.'
arch=('i686' 'x86_64')
url='http://zibopt.zib.de/'
license=('LGPL3' 'custom:ZIB Academic License')
depends=('zlib' 'gmp' 'readline')
makedepends=('chrpath' 'doxygen' 'graphviz')
provides=('scip=2.1.1' 'soplex=1.6.0' 'zimpl=3.2.0')
source=(
	"http://zibopt.zib.de/download/${pkgname}-${pkgver}.tgz"
	'fileio.c.patch'
	)
sha256sums=(
	'f17e78634140c3e903299e22817ad21011ce1bbee44e9bbff858ba95c4bda11a'
	'f89f79036152edfac142ff5edebb4a56626aa67cd212c085551329e1685eedd9'
	)

build() {
	# Extract directory names from the $provides array.
	local _scip="${provides[0]//=/-}"
	local _soplex="${provides[1]//=/-}"
	local _zimpl="${provides[2]//=/-}"

	cd "${srcdir}/${pkgname}-${pkgver}"

	# Fix compiler error in fileio.c, reported by Tuxe.
	# @FIXME: Remove this in the next version
	if [ ! -d `pwd`/${_scip} ] ; then
		make `pwd`/${_scip}
		patch -i "${srcdir}/fileio.c.patch" ${_scip}/src/scip/fileio.c
	fi

	make

	# A local RPATH is set, get rid of it.
	chrpath --delete ${_scip}/bin/scip
	chrpath --delete ${_soplex}/bin/soplex

	cd "${srcdir}/${pkgname}-${pkgver}/${_scip}"
	make doc

	cd "${srcdir}/${pkgname}-${pkgver}/${_soplex}"
	make doc

	# Some files have permission 640.
	# @FIXME: Future versions might not require this line.
	chmod -R a+r "${srcdir}/${pkgname}-${pkgver}"
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make test
}

package_ziboptsuite() {
	# Extract directory names from the $provides array
	local _scip="${provides[0]//=/-}"
	local _soplex="${provides[1]//=/-}"
	local _zimpl="${provides[2]//=/-}"

	# Note that, at least in ziboptsuite-2.1.0, the install targets of the
	# scip/soplex/zimpl projects are utterly broken; manually copying
	# everything where it belongs is absolutely necessary.
	# @FIXME: Maybe make install will just work in future releases...

	cd "${srcdir}/${pkgname}-${pkgver}"

	#
	# Binaries
	#
	install -D -m755 ${_scip}/bin/scip "${pkgdir}/usr/bin/scip"
	install -D -m755 ${_soplex}/bin/soplex "${pkgdir}/usr/bin/soplex"
	install -D -m755 ${_zimpl}/bin/zimpl "${pkgdir}/usr/bin/zimpl"

	#
	# Includes
	#
	for dir in blockmemshell dijkstra nlpi objscip scip tclique xml; do
		mkdir -p "${pkgdir}/usr/include/scip/${dir}"
		cp ${_scip}/src/${dir}/*.h "${pkgdir}/usr/include/scip/${dir}"
	done

	mkdir -p "${pkgdir}/usr/include/"{soplex,zimpl}
	cp ${_soplex}/src/*.h "${pkgdir}/usr/include/soplex"
	cp ${_zimpl}/src/*.h "${pkgdir}/usr/include/zimpl"

	#
	# Libraries
	#
	mkdir -p "${pkgdir}/usr/lib"
	cp -d ${_scip}/lib/liblpispx* "${pkgdir}/usr/lib"
	cp -d ${_scip}/lib/libnlpi* "${pkgdir}/usr/lib"
	cp -d ${_scip}/lib/libobjscip* "${pkgdir}/usr/lib"
	cp -d ${_scip}/lib/libscip* "${pkgdir}/usr/lib"
	cp -d ${_soplex}/lib/* "${pkgdir}/usr/lib"
	cp -d ${_zimpl}/lib/* "${pkgdir}/usr/lib"

	# Repair "missing links"
	# @FIXME: I hope this is not necessary in future versions!
	cd "${pkgdir}/usr/lib"
	ln -s -T libzimpl-* libzimpl.a
	cd "${srcdir}/${pkgname}-${pkgver}"

	#
	# Documentation
	#
	mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/"{scip,soplex,zimpl}
	cp -r ${_scip}/{CHANGELOG,release-notes,doc/html} "${pkgdir}/usr/share/doc/${pkgname}/scip/"
	cp -r ${_soplex}/{CHANGELOG,doc/html} "${pkgdir}/usr/share/doc/${pkgname}/soplex/"
	install -m644 ${_soplex}/src/simpleexample.cpp "${pkgdir}/usr/share/doc/${pkgname}/soplex/"
	cp -r ${_zimpl}/{CHANGELOG,README,doc,example} "${pkgdir}/usr/share/doc/${pkgname}/zimpl/"

	#
	# License
	#
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
