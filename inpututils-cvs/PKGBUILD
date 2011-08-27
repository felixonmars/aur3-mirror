# Contributor: Brendan M. <gekko.AT.bbqsrc.DOT.net>
pkgname=inpututils-cvs
pkgver=20071021
pkgrel=1
pkgdesc="Joystick and gamepad input utilities for testing functionality."
arch=('i686')
url="http://linuxconsole.sf.net"
license=('GPL')
depends=('glibc')
makedepends=('gcc' 'cvs')
provides=('inpututils')
conflicts=('inpututils')
md5sums=()
source=()

_cvsroot="pserver:anonymous:@linuxconsole.cvs.sourceforge.net:/cvsroot/linuxconsole"
_cvsmod="inpututils"

build() {
	mkdir -p $startdir/src/$_cvsmod && cd $startdir/src/$_cvsmod
	 cvs -d:$_cvsroot login || return 1
	 cvs -z3 -d:$_cvsroot co -P ruby/utils || return 1
	 cp -r ../$_cvsmod ../$_cvsmod-build
	cd $startdir/src/$_cvsmod-build/ruby/utils
	 make clean || return 1
	 make jscal || return 1
	 make jstest || return 1
	 make inputattach || return 1
	mkdir -p $startdir/pkg/usr/bin || return 1
	 install -s jscal jstest inputattach $startdir/pkg/usr/bin/ || return 1
	rm -r $startdir/src/$_cvsmod-build
}
