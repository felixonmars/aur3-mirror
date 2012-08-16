# Contributor: T-T

pkgname='t-t_differ'
pkgver='1.1'
pkgrel=0
pkgdesc="Simple Bash script to find and delete (or move, copy) duplicite files."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/differ/files/"
license=('BSD')
depends=(bash)
makedepends=()
conflicts=()
optdepends=()

source=("https://downloads.sourceforge.net/project/ttdiffer/differ-$pkgver")
md5sums=(90417ca5dbb43a6357ff983b81b9ff5f)

build() {
	cd $srcdir/
	
	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/bin
	
	cp `readlink $srcdir/differ-$pkgver` $pkgdir/usr/bin/differ
	chmod +x $pkgdir/usr/bin/differ
}
