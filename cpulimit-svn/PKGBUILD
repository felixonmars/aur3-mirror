# Maintainer: Thomas C. <Sekereg at gmx dot com>

pkgname=cpulimit-svn
pkgver=41
pkgrel=1
pkgdesc="Limit cpu usage in %. Actualy sends SIGSTOP/SIGCONT"
arch=('i686' 'x86_64')
url="http://cpulimit.sourceforge.net/"
license=('GPL')
provides=('cpulimit')
conflicts=('cpulimit')
makedepends=('glibc' 'subversion')

_svntrunk="https://cpulimit.svn.sourceforge.net/svnroot/cpulimit/trunk"
_svnmod=cpulimit

build() {
	cd ${srcdir}
	
	if [ ! -d ${srcdir}/${_svnmod} ]; then
		svn co ${_svntrunk} ${_svnmod}
	else
		(cd ${_svnmod} && svn up -r ${pkgver})
	fi
	
	msg "SVN checkout done or server timeout."
	msg "Starting make..."
	
	mkdir -p ${srcdir}/${_svnmod}
	cd ${srcdir}/${_svnmod}/
	make || return 1
	install -D -m755 ${srcdir}/${_svnmod}/cpulimit ${pkgdir}/usr/bin/cpulimit || return 1
}
