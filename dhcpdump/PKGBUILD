# Maintainer: kozec <kozec at kozec dot com>
# Contributor: Petr Malat <petris@penguin.cz> 

pkgname=dhcpdump
packager=petris
license="custom:opensource"
pkgver=1.8
pkgrel=3
pkgdesc="Parses the output of tcpdump to display the dhcp-packets for easier checking and debugging."
url="http://www.mavetju.org/unix/dhcpdump-man.php"
depends=("tcpdump")
arch=("i686" "x86_64")
source=(http://www.mavetju.org/download/$pkgname-$pkgver.tar.gz patch.patch)

build() {
	cd $srcdir/$pkgname-$pkgver
	patch -Np0 -i ../patch.patch
	make prefix=$startdir/pkg/usr/ all
}

package() {
	cd $startdir/src/$pkgname-$pkgver
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	mkdir -p $pkgdir/usr/share/man/man8
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/ 
	cp dhcpdump $pkgdir/usr/bin
	cp dhcpdump.8 $pkgdir/usr/share/man/man8
}

md5sums=('099c786997c424f196414f9575f1fb90'
         'eaa7196d65fb4b602bd0744294412e3a')
md5sums=('099c786997c424f196414f9575f1fb90'
         'a0d99cd493944364d280775b56178779')
