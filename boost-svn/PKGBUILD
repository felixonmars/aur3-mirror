# Maintainer: Tianjiao Yin <ytj000(at)gmail(dot)(see)(oh)(em)>
# Contributor: Tianjiao Yin <ytj000(at)gmail(dot)(see)(oh)(em)>

# Howto get revision number ?
# svn log http://svn.boost.org/svn/boost/trunk --limit 1 | grep -m 1 -o r.* | cut -d \| -f 1 | sed s@r@@g

pkgname=boost-svn
_svntrunk=http://svn.boost.org/svn/boost/trunk

# The newest svn version may failed to compile. 
# If this happens, comment the next line.
_svnmod=boost
pkgver=73469 
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.boost.org/"
license=('custom')

depends=('icu' 'python' 'python2' 'openmpi' 'docbook-xml' 'docbook-xsl' 'libxslt' 'doxygen')

# For boost documentation. If you don't need any document, you can remove this and any
# documentation parts in build() and package()
makedepends=( 'subversion' 'texlive-bibtexextra' 'texlive-core'
'texlive-fontsextra' 'texlive-formatsextra' 'texlive-games'
'texlive-genericextra' 'texlive-htmlxml' 'texlive-humanities'
'texlive-latexextra' 'texlive-music' 'texlive-pictures' 'texlive-plainextra'
'texlive-pstricks' 'texlive-publishers' 'texlive-science')


conflicts=('boost' 'boost-libs' 'boost-build')
provides=('boost' 'boost-libs' 'boost-build' 'boost-tools')

pkgdesc="Free peer-reviewed portable C++ source libraries. Include boost tools."

source=(boost-build-config boost-svn.install cleaner)
install=boost-svn.install
_boostdir="${srcdir}/boost-trunk"
_svndir="${srcdir}/boost-trunk-svn"
_stagedir="${srcdir}/stage"
_builddir="${srcdir}/build"

build() {
	cd ${srcdir}
	rm -rf ${_stagedir}
	rm -rf ${_boostdir}
	svn co ${_svntrunk} ${_svndir} -r ${pkgver}
	cp ${_svndir} ${_boostdir} -R

	# ======================================================================== #
	# build bjam 
	# Don't remove this unless you want to build by hand.
	# ======================================================================== #
	cd "${_boostdir}"
	./bootstrap.sh
	_bjampath="${_boostdir}/bjam"
	_boostbook_path="${_boostdir}/tools/boostbook"
	_bjammake="${_bjampath} release ${MAKEFLAGS} --ignore-config"

	# ======================================================================== #
	# Setting project-config.jam for boost build
	# ======================================================================== #
	python3 "${srcdir}/boost-build-config" --setup \
		-o project-config.jam \
		-b ${_boostbook_path} \
		-a quickbook "using quickbook ;"

	# ======================================================================== #
	# build libs
	# ======================================================================== #
	${_bjammake} \
		--prefix=${_stagedir} \
		install

	# ======================================================================== #
	# build tools
	# ======================================================================== #
	cd "${_boostdir}/tools"
	${_bjammake}
	install -m755 "${_boostdir}/bjam" "${_boostdir}/dist/bin/bjam"

	# ======================================================================== #
	# build Documentation
	# ======================================================================== #
	cd "${_boostdir}/doc"
	rm html -rf
	${_bjammake}
}

package(){
	# All this parts are independent. You can remove anyone is you don't like it.

	# ======================================================================== #
	# =======================          Boost           ======================= #
	# ======================================================================== #

	#pkgdesc="Free peer-reviewed portable C++ source libraries - Development"
	#depends=("boost-libs-svn=${pkgver}")
	#optdepends=('python: for python bindings' 'python2: for python2 bindings')
	#conflicts=('boost')
	#provides=('boost')

	install -d "${pkgdir}"/usr/{include,lib}

	# headers/source files
	cp -r "${_stagedir}"/include/ "${pkgdir}"/usr/

	# static libs
	cp -r "${_stagedir}"/lib/*.a "${pkgdir}"/usr/lib/

	# license
	install -D -m644 "${_boostdir}/LICENSE_1_0.txt" \
		"${pkgdir}"/usr/share/licenses/boost/LICENSE_1_0.txt

	# ======================================================================== #
	# =======================        Boost Libs        ======================= #
	# ======================================================================== #

	#pkgdesc="Free peer-reviewed portable C++ source libraries - Runtime"
	#depends=('gcc-libs' 'icu')
	#optdepends=('openmpi: for mpi support')
	#conflicts=('boost-libs')
	#provides=('boost-libs')

	install -d "${pkgdir}/usr/lib"

	#shared libs
	cp -r "${_stagedir}"/lib/*.so{,.*} "${pkgdir}/usr/lib/"

	# ======================================================================== #
	# =======================        BoostTools        ======================= #
	# ======================================================================== #

	#pkgdesc="Toolset of Boost, include boostbuild, boostbook, bcp, etc."
	#depends=("python" "openmpi" "docbook-xml" "docbook-xsl" "libxslt" "doxygen")
	#conflicts=('boost-build' 'boost-tools')
	#provides=('boost-build' 'boost-tools')
	
	cp -r "${_boostdir}"/dist/* "${pkgdir}"/usr/

	install -D -m755 "${srcdir}/boost-build-config" "${pkgdir}/etc/rc.d/boost-build-config"

	install -d "${pkgdir}/usr/share"
	cd "${_boostdir}/tools/build/"
	cp -R "v2" "${pkgdir}/usr/share/boost-build"

	_site_cfg="${pkgdir}/etc/site-config.jam"
	touch ${_site_cfg}


	# remove engine
	rm -rf "${pkgdir}/usr/share/boost-build/engine"

	# clean svn directory
	#find ${pkgdir} -type d -name ".svn" | xargs rm -rf

	# ======================================================================== #
	# =======================    Boost Documetation    ======================= #
	# ======================================================================== #

	#
	# pkgdesc="Boost Documetation"
	#

	cd ${_boostdir}
	rm -rf bin.v2
	python3 "${srcdir}/cleaner" remove

	cd ${srcdir}
	mkdir -p "${pkgdir}/usr/share/doc"
	mv ${_boostdir} "${pkgdir}/usr/share/doc/boost"

	# ======================================================================== #
	# clean svn directory
	# ======================================================================== #

	find ${pkgdir} -type d -name ".svn" | xargs rm -rf
}
md5sums=('fa8b1c5b9cd7fc31fbbc91cb1286c4c6'
         'd5a7f2be0b28f41f2a3107252544a4f1'
         'f000ab20a4976a564dbc9ac8eeed2766')

