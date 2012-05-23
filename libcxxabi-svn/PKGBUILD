	# Maintainer: Benno Fünfstück <pyhaxor@googlemail.com>

pkgname="libcxxabi-svn"
pkgver=155994
pkgrel=1
pkgdesc="a new implementation of low level support for a standard C++ library."
arch=('i686' 'x86_64')
url="http://libcxxabi.llvm.org/"
license=('MIT' 'custom:University of Illinois/NCSA Open Source License')
depends=('libcxx-svn')
makedepends=('subversion' 'libunwind' 'clang' )
source=()
md5sums=()

_svntrunk=http://llvm.org/svn/llvm-project/libcxxabi/trunk
_svnmod=libcxxabi

build() {
	# Checkout
	cd "$srcdir"
	if [ -d $_svnmod/.svn ]; then
		cd $_svnmod
		svn up
	else
		svn co $_svntrunk $_svnmod
		cd $_svnmod
	fi
	msg "SVN checkout done or server timeout"
	msg "Starting make..."
	# Build
	echo ${PWD}
	cd lib
	./buildit
}

package() {
	cd "$srcdir/$_svnmod/"
	mkdir -p ${pkgdir}/usr/include
	mkdir -p ${pkgdir}/usr/lib
	install lib/libc++abi.so.1.0 ${pkgdir}/usr/lib/libc++abi.so.1.0
	ln -s /usr/lib/libc++abi.so.1.0 ${pkgdir}/usr/lib/libc++abi.so.1
	ln -s /usr/lib/libc++abi.so.1.0 ${pkgdir}/usr/lib/libc++abi.so
	install include/* ${pkgdir}/usr/include
	install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
