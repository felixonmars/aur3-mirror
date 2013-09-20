# Maintainer: Márcio Carneiro <marciocr@gmail.com>
# Contributor: MrSunshine
pkgname=derelict2-svn
pkgver=634
pkgrel=3
pkgdesc="Derelict2 is a collection of D bindings to C shared (dynamic) libraries which are useful for multimedia applications, with a heavy bias toward game development-related libraries."
arch=('i686' 'x86_64')
url="http://www.dsource.org/projects/derelict"
license=('BSD')
depends=('dmd')
makedepends=('subversion')
provides=('derelict')
conflicts=('derelict3-git')
optdepends=('sdl>1.2.13')
#install=(${pkgname}.install)
md5sums=('') 

_svntrunk=http://svn.dsource.org/projects/derelict/branches/Derelict2
_svnmod=Derelict2

build() {
	cd $srcdir

	if [ -d ${_svnmod} ]; then
		cd ${srcdir}/${_svnmod}
		svn up
	else
		svn co ${_svntrunk} ${_svnmod} -r${pkgver} || return 1
	fi

	mkdir -p ${pkgdir}/usr/lib
   	mkdir -p ${pkgdir}/usr/include/d

	cd ${srcdir}/${_svnmod}

	cd ${srcdir}/${_svnmod}
	make -f linux.mak DC=dmd LIB_DEST=${pkgdir}/usr/lib IMPORT_DEST=${pkgdir}/usr/include/d
}
