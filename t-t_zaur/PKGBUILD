# Contributor: T-T

pkgname='t-t_zaur'
pkgver='1.3.2'
pkgrel=0
pkgdesc="Extract, make and install package from AUR in terminal"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/zaur/files/"
license=('BSD')
depends=(bash xfce4-terminal pacman)
makedepends=()
conflicts=()
optdepends=()

source=("https://downloads.sourceforge.net/project/zaur/$pkgver/mkpkg" "https://downloads.sourceforge.net/project/zaur/$pkgver/mksrc" "https://downloads.sourceforge.net/project/zaur/$pkgver/zaur" "https://downloads.sourceforge.net/project/zaur/$pkgver/zaur.conf")
md5sums=(f522d8b346ef689784421b10027bf806 bcd2143701d3358a40d11b6028c9254e 73949c997f1afe604a302da60ffbdecb 14d0e7804a3d8bc574ea56dd56c36a77)
md5sums=(07047c6dedea604582eb2cb4dbaa8e52 71541ce44a35b57c6af58eb91ab510c2 39b2e58ff2af8accb264e2fdd399c1da 14d0e7804a3d8bc574ea56dd56c36a77)

build() {
	cd $srcdir/
	
	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/bin
	mkdir $pkgdir/etc
	
	for file in mkpkg mksrc zaur; do
		mv `readlink $srcdir/$file` $pkgdir/usr/bin/$file
		chmod +x $pkgdir/usr/bin/$file
	done
	file=zaur.conf
	mv `readlink $srcdir/$file` $pkgdir/etc/$file
	chmod +x $pkgdir/etc/$file
}
