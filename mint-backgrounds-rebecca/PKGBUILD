pkgname=mint-backgrounds-rebecca
pkgver=1.5
pkgrel=2
pkgdesc="A collection of backgrounds from Linux Mint 17.1"
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm')
url="http://packages.linuxmint.com/pool/main/m/mint-backgrounds-rebecca/"
license=("various")
source=("http://packages.linuxmint.com/pool/main/m/mint-backgrounds-rebecca/mint-backgrounds-rebecca_1.5.tar.gz")
md5sums=("SKIP")

package() {
	cd "$srcdir/$pkgname-$pkgver"
	#copy all files, but not the debian folder
	mkdir -p $pkgdir/usr/share/backgrounds
	cp -a backgrounds/linuxmint-rebecca $pkgdir/usr/share/backgrounds/
	cp -r cinnamon-background-properties $pkgdir/usr/share
	cp -r gnome-background-properties $pkgdir/usr/share
	
}
