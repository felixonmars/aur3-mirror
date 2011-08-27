# author: MrSunshine
pkgname=mango-svn
pkgver=1122
pkgrel=1
pkgdesc="Mango is a collection of D packages with an orientation toward network programming. Mango extends the Tango library in a number of useful ways by supplementing with XML, clustering, a servlet engine, and an HTTP server."
arch=('i686' 'x86_64')
url="http://www.dsource.org/projects/ldc"
license=('BSD')
#depends=()
makedepends=('ldc' 'subversion' 'dsss')
#provides=()
#conflicts=()
source=(ldc-fix.patch)
#install=(${pkgname}.install)
md5sums=('69e97251f942ded00bbaf55dbef95489') 

_svntrunk=http://svn.dsource.org/projects/mango/trunk
_svnmod=mango

build() {
	cd $srcdir

	if [ -d ${_svnmod} ]; then
		cd ${startdir}/src/${_svnmod}
		svn up
	else
		svn co ${_svntrunk} ${_svnmod} || return 1
	fi

	cd ${startdir}/src/${_svnmod}

	patch -t -N -p0 -i ${startdir}/ldc-fix.patch
	dsss build

	dsss install --prefix=$startdir/pkg/usr

	chmod +r ${startdir}/pkg/usr/share/dsss/manifest/mango.manifest
}
