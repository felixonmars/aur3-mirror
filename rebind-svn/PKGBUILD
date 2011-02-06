pkgname=rebind-svn
pkgver=7
pkgrel=1
pkgdesc="DNS Rebinding Tool"
arch=('i686' 'x86_64')
url="http://code.google.com/p/rebind/"
license=('MIT')
depends=('sqlite3' 'readline')
makedepends=('subversion')
source=()
md5sums=()

_svntrunk=http://rebind.googlecode.com/svn/trunk/
_svnmod=rebind

build()
{
	cd ${srcdir}
	svn co ${_svntrunk} ${_svnmod} -r ${pkgver} || return 1
	msg "SVN checkout done or server timeout"
	msg "Starting make..."
	
	cd ${_svnmod}/src
	
	cd ../dev || return 1

	mv htmltoc.py htmltoc.py.tmp
	mv pngtoc.py pngtoc.py.tmp

	touch htmltoc.py pngtoc.py

	echo "#!/usr/bin/env python2" > htmltoc.py > pngtoc.py

	cat htmltoc.py.tmp >> htmltoc.py
	cat pngtoc.py.tmp >> pngtoc.py

	chmod 777 htmltoc.py pngtoc.py

	cd ../src

	make || return 1
	make install  || return 1
	cd ../bin || return 1
	mkdir ${pkgdir}/usr/ || return 1
	mkdir ${pkgdir}/usr/bin || return 1
	cp rebind ${pkgdir}/usr/bin
}

