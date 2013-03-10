pkgname='lbanet-zeroc-ice'
pkgver=3.4.2
_pkgmaj=3.4
pkgrel=1
pkgdesc='An object-oriented middleware that provides object-oriented Remote Procedure Call functionality'
arch=('i686' 'x86_64')
url='http://www.zeroc.com'
license=('GPL' 'custom: ICE license')
makedepends=('apache-ant' 'mcpp' 'openssl' 'expat' 'db4.8' 'binutils' 'tar')
depends=('db4.8' 'openssl' 'expat')
source=("http://www.zeroc.com/download/Ice/$_pkgmaj/Ice-$pkgver.tar.gz" 'ice_for_clang.txt')
md5sums=('e97672eb4a63c6b8dd202d0773e19dc7' '5f5bc058074830db88bfdf20032f6091')

_fix_unistd() {
	sed -i 1i"#include <unistd.h>" "$1"
}

build() {
	cd "$srcdir/Ice-$pkgver"
	patch -p0 -i ../ice_for_clang.txt
	cd cpp
	_fix_unistd src/IceUtil/FileUtil.cpp
	_fix_unistd src/Slice/FileTracker.cpp
	msg 'Switching includes to db 4.8...'
	find . -name '*.cpp' -o -name '*.h' -exec sed -i 's|#include <db|#include <db4.8/db|' {} \;
	msg 'Building...'
	make OPTIMIZE=yes prefix="$srcdir/package" embedded_runpath_prefix="" install
}

package() {
	local makedir="$srcdir/package"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$makedir/ICE_LICENSE" "$pkgdir/usr/share/licenses/$pkgname/ICE_LICENSE"

	install -dm755 "$pkgdir/usr"
	cp -r "$makedir/bin" "$pkgdir/usr"
	install -dm755 "$pkgdir/usr/lib"
	cp -r "$makedir/lib"*/. "$pkgdir/usr/lib"
	cp -r "$makedir/include" "$pkgdir/usr"

	local datadir="$pkgdir/usr/share/Ice"
	install -dm755 "$datadir"
	cp -r "$makedir/slice" "$datadir"
	cp "$makedir/lib/ImportKey.class" "$datadir"
}
