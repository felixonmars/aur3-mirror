# Maintainer: jianingy <jianingy.yang AT gmail.com>
# Contributor: cmb <chris AT the-brannons.com>
# Contributor: hatred <hatred AT inbox.ru>

pkgname=daemontools
pkgrel=7
pkgver=0.76
pkgdesc="daemontools is a collection of tools for managing UNIX services."
arch=(i686 x86_64 armv6h)
url="http://cr.yp.to/daemontools.html"
license=('public domain')
depends=('pacman>=3.1.0')
backups=('/etc/inittab')
install=daemontools.install
source=(
	"http://cr.yp.to/daemontools/$pkgname-$pkgver.tar.gz"
	"http://smarden.org/pape/djb/manpages/daemontools-0.76-man.tar.gz"
	'daemontools-0.76.errno.patch'
	'daemontools-0.76.svscanboot-path-fix.patch'
	'svscan.service'
)
md5sums=(
    '1871af2453d6e464034968a0fbcb2bfc'
	'2d3858a48f293c87202f76cd883438ee'
	'1ab80be37239e920542425baa8f1c5b9'
	'55ee6f55f01e9df3c432ac764875087e'
	'8915bb319b7cf68376ee51a356b87f88'
)
sha1sums=(
	'70a1be67e7dbe0192a887905846acc99ad5ce5b7'
	'28e167def0e457f2be10aa90504c402fa08723ab'
	'ee5b43b333dae9ee3ad0d2f9aeb9c1e2537f0978' 
	'f0bec75cd93a777b02fe89fd4c10af3f76eaee84'
	'cc3cba1108efecb8a7f605114751f54ae23b19a3'
)

build() { 
	cd $srcdir/admin/$pkgname-$pkgver || exit 1
	patch -p1 < $srcdir/daemontools-0.76.errno.patch || exit 1
	patch -p1 < $srcdir/daemontools-0.76.svscanboot-path-fix.patch || exit 1
	package/compile || exit 1
}

package() {
	cd $srcdir/admin/$pkgname-$pkgver || exit 1
	mkdir -pv $pkgdir/usr/bin $pkgdir/service || exit 1
	cp -a command/* $pkgdir/usr/bin || exit 1
	mkdir -p $pkgdir/usr/share/man/man8 || exit 1
	cp -a $srcdir/daemontools-man/* $pkgdir/usr/share/man/man8 || exit 1
	mkdir -p $pkgdir/usr/lib/systemd/system || exit 1
	cp $srcdir/svscan.service $pkgdir/usr/lib/systemd/system || exit 1
}
