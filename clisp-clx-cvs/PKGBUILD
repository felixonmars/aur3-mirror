# Contributor: hocwp <hocwp[at]free[dot]fr>

pkgname=clisp-clx-cvs
pkgver=1
pkgrel=1
pkgdesc="MIT/CLX module for clisp"
url="http://clisp.cvs.sourceforge.net/clisp/clisp/modules/clx/mit-clx/"
license='BSD'
arch=('i686' 'x86_64')
depends=('clisp')
makedepends=('cvs')
backup=(usr/lib/clisp/full/lispinit.mem)
conflicts=()
provides=()
source=()
md5sums=()


_cvsroot=":pserver:anonymous@clisp.cvs.sourceforge.net:/cvsroot/clisp"
_cvsmod="clisp/modules/clx/mit-clx"

build() {
	cd $startdir/src
	msg "Connecting to $_cvsmod CVS server...."
	cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
	cd $_cvsmod
	msg "CVS checkout done or server timeout"
	msg "Starting to build clisp image"
	clisp -m 4MB -E ISO-8859-1 -q -i defsystem -x '(compile-clx) (saveinitmem "lispinit.mem")'
	mkdir -p $startdir/pkg/usr/lib/clisp/full/
	cp lispinit.mem $startdir/pkg/usr/lib/clisp/full/
}
