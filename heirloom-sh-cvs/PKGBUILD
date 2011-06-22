# Maintainer: Jens Staal <staal1978 at gmail dot com>
# Contributor: Sascha Biermmanns <saschakb at gmail dot com>
# Contributor: Daniel Leidisch <spam@leidisch.net>
# Updated by: Jens Staal <staal1978@gmail.com>

pkgname=heirloom-sh-cvs
pkgver=2011.06.22
pkgrel=1
pkgdesc="Traditional sh [jsh(1)], derived from OpenSolaris code. CVS repository"
arch=('i686' 'x86_64')
url="http://heirloom.sourceforge.net/sh.html"
license=('custom:"caldera"' 'custom:"opensolaris"')
provides=('sh' 'heirloom-sh')
replaces=('heirloom-sh')
makedepends=('cvs')
conflicts=()
source=('000-config.diff')
md5sums=('991b32bee780ce48685dfd4d39d41443')


build() {
	cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom login

	cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom co -P heirloom-sh

	rm -rf $srcdir/build #starting fresh
	cp -ar $srcdir/heirloom-sh $srcdir/build

	cd $srcdir/build
        patch -p1 < ../000-config.diff

	make
}
package() {		
        cd $srcdir/build

	make install ROOT="$pkgdir"
	mkdir -p $pkgdir/usr/share/licenses/$pkgname/
	install -m644 CALDERA.LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/CALDERA
}