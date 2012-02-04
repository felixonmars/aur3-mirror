# Contributor: gothicknight <gothicknight@gmail.com>

# ------------------------------------------------------------------ Package Description
pkgname=lach
pkgver=0.5.5
pkgrel=2
pkgdesc="Laptop ATI CPU & HDD Control"
url="http://sf.net/projects/lach"
license="GPL"
arch=(i686)

# ------------------------------------------------------------------ Package Management
depends=(hddtemp hdparm)
conflicts=(lach)
provides=(lach)

# ------------------------------------------------------------------ Files
source=(http://mesh.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
	Makefile.patch
	configure.patch)

md5sums=('a5e653ca69d5da7581061da5a62c65a4'\
	 '88981f0ee1027d61119adef7ca94dd5c'\
	 '3383cf241d69668319be4723ce75e22d')

# ------------------------------------------------------------------ Build and instalation
build() {
	cd $startdir/src/
	patch Makefile Makefile.patch
	patch configure configure.patch
	make
	mkdir $startdir/pkg/usr/
	mkdir $startdir/pkg/usr/bin
	cp lach $startdir/pkg/usr/bin/
}
