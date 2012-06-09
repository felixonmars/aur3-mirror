# Maintainer: Jens Staal <staal1978 at gmail dot com>
# Contributor: Sascha Biermmanns <saschakb at gmail dot com>
# Contributor: Daniel Leidisch <spam@leidisch.net>
# Updated by: Jens Staal <staal1978@gmail.com>

pkgname=heirloom-sh-musl-cvs
pkgver=20120609
pkgrel=1
pkgdesc="sh [jsh(1)], derived OpenSolaris code, statically linked to musl libc"
arch=('i686' 'x86_64')
url="http://heirloom.sourceforge.net/sh.html"
license=('custom:"caldera"' 'custom:"opensolaris"')
provides=('sh' 'heirloom-sh' 'heirloom-sh-cvs')
depends=('musl')
replaces=('heirloom-sh' 'heirloom-sh-cvs')
makedepends=('cvs')
conflicts=()
source=('000-config.diff' 'defs.patch')
md5sums=('991b32bee780ce48685dfd4d39d41443' 'efb9d05c204480be7e9b7a5c15d52a80')


build() {
	cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom login

	cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom co -P heirloom-sh

	rm -rf $srcdir/build #starting fresh
	cp -ar $srcdir/heirloom-sh $srcdir/build

	cd $srcdir/build
        patch -p1 < ../000-config.diff
        patch defs.h $srcdir/defs.patch #disable dependency on sys/acct.h

	make CC="musl-gcc -static"
}
package() {		
        cd $srcdir/build

	make install ROOT="$pkgdir"
	mkdir -p $pkgdir/usr/share/licenses/$pkgname/
	install -m644 CALDERA.LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/CALDERA
}