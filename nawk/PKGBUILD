pkgname=nawk
pkgver=20110810
pkgrel=1
pkgdesc="The one, true implementation of the AWK, by one of the language's creators, Brian Kernighan."
url="http://cm.bell-labs.com/who/bwk/"
license=('MIT') # I'm not sure. See README for more info.
arch=('i686' 'x86_64')
source=(http://www.cs.princeton.edu/~bwk/btl.mirror/awk.tar.gz)
md5sums=('a7062ecade93dc4cb39190e48db9a51d')

build() {
	cd $startdir/src/

	make
	install -Dm755 a.out $startdir/pkg/usr/bin/nawk
	install -Dm644 awk.1 $startdir/pkg/usr/share/man/man1/nawk.1
	sed -n '/Copyright/,/THIS SOFTWARE\./p' README > LICENSE
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
