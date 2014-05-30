# Maintainer: Your Name <youremail@domain.com>
pkgname=mint-backgrounds-qiana
pkgver=1.2
pkgrel=1
pkgdesc="The desktop backgrounds made for Linux Mint 17 Qiana"
arch=("any")
url="http://packages.linuxmint.com/pool/main/m/mint-backgrounds-qiana/"
license=('unknown')
source=("http://packages.linuxmint.com/pool/main/m/$pkgname/mint-backgrounds-qiana_$pkgver.tar.gz")
md5sums=('3fb055f4a9074ffe37afcf00b9d8647e')

package() {
	cd "$srcdir/$pkgname"
	#copy all files, but not the debian folder
	cp -r usr/ $pkgdir/
	#some files needed permissions.
	chmod 644 $pkgdir/usr/share/backgrounds/linuxmint-qiana/linux_mint_{17,qiana}.png
}
