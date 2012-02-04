# author: MrSunshine
pkgname=derelict-svn
pkgver=320
pkgrel=1
pkgdesc="Derelict is a collection of D bindings to C shared (dynamic) libraries which are useful for multimedia applications, with a heavy bias toward game development-related libraries."
arch=('i686' 'x86_64')
url="http://www.dsource.org/projects/ldc"
license=('BSD')
#depends=()
makedepends=('ldc' 'gcc' 'subversion' 'dsss')
#provides=()
#conflicts=()
source=(derelict.patch)
#install=(${pkgname}.install)
md5sums=('c13daeefd701637c10c4454dbc68bdcf') 

_svntrunk=http://svn.dsource.org/projects/derelict/trunk
_svnmod=derelict

build() {
	cd $srcdir

	if [ -d ${_svnmod} ]; then
		cd ${startdir}/src/${_svnmod}
		svn up
	else
		svn co ${_svntrunk} ${_svnmod} -r${pkgver} || return 1
	fi

	cd ${startdir}/src/${_svnmod}

	patch -p0 -t -N -i ${startdir}/derelict.patch

	cd ${startdir}/src/${_svnmod}
	dsss build --prefix=${startdir}/src/tmp
	dsss install --prefix=${startdir}/pkg/usr

	chmod +r ${startdir}/pkg/usr/share/dsss/manifest/derelict.manifest
}
