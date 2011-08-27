# author: MrSunshine
pkgname=ddbi-svn
pkgver=100
pkgrel=1
pkgdesc="D DBI is a database independent interface for the D programming language."
arch=('i686' 'x86_64')
url="http://www.dsource.org/projects/ldc"
license=('BSD')
depends=('libmysqlclient')
makedepends=('ldc' 'subversion' 'dsss')
#provides=()
#conflicts=()
source=()
#install=(${pkgname}.install)
md5sums=() 

_svntrunk=http://svn.dsource.org/projects/ddbi/trunk
_svnmod=ddbi

build() {
	cd $srcdir

	if [ -d ${_svnmod} ]; then
		cd ${startdir}/src/${_svnmod}
		svn up
	else
		svn co ${_svntrunk} ${_svnmod} || return 1
	fi

	cd ${startdir}/src/${_svnmod}

	dsss build -version=dbi_mysql

	dsss install --prefix=$startdir/pkg/usr

	chmod +r ${startdir}/pkg/usr/share/dsss/manifest/dbi.manifest
}
