# Contributor: kumyco <mailme@nrk.cc>
pkgname=halflyf
pkgver=0.0.1
pkgrel=1
license=('custom')
pkgdesc="A Purple plugin ... Changes the status message, based on a `command` output."
arch=(i686 x86_64)
url="http://purple.nrk.cc/"
depends=('pidgin')
source=(http://nrk.cc/src/hl/halfLyf-$pkgver.tar.bz2)
install=halflyf.install

md5sums=('698f7420a28b56a4e9c92fca19e82f4d')
sha1sums=('211a803d0e5c63051fd1236af082ee6c3b0be92f')


build() {
	cd $srcdir
	make || return 1
	install -m0644 -D $srcdir/license.txt $pkgdir/usr/share/licenses/$pkgname/ppl.txt
	install -m0644 -D $srcdir/halfLyf.so $pkgdir/usr/lib/purple-2/halfLyf.so
}
