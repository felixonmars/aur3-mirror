pkgname=nxc  
pkgver=1.2.1.r4
pkgrel=1 
pkgdesc="Not eXactly C -- to program LEGO's NXT programmable brick"
url="http://bricxcc.sourceforge.net/nbc"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libusb' 'libusb-compat' 'lego-udev-rules')
makedepends=('fpc' 'lazarus')
source=(http://downloads.sourceforge.net/bricxcc/nbc-${pkgver}.src.tgz)
md5sums=('d56d7c28b17f75470a77473f0b833878')
noextract=("nbc-$pkgver.src.tgz")
build() {
	cd $srcdir
	install -d nbc
	tar xzf nbc-$pkgver.src.tgz -C nbc
	cd nbc/NXT

	# strange behavior: the first two make processes fail
	make -f nbcunix.mak || make -f nbcunix.mak || make -f nbcunix.mak
	install -D -m755 nbc $pkgdir/usr/bin/nbc
}

