# Maintainer: Your Name <youremail@domain.com>
pkgname=mint-backgrounds-olivia
pkgver=1.4
pkgrel=1
pkgdesc="The desktop backgrounds made for Linux Mint 15 Olivia"
arch=("any")
url="http://packages.linuxmint.com/pool/main/m/mint-backgrounds-olivia/"
license=('unknown')
source=("http://packages.linuxmint.com/pool/main/m/$pkgname/"$pkgname"_$pkgver.tar.gz")
md5sums=('0172765e37d26caec22a5f663568bd5a')

package() {
	cd "$srcdir/$pkgname"
	#copy all files, but not the debian folder
	cp -r usr/ $pkgdir/
	#some files needed permissions.
	chmod 644 $pkgdir/usr/share/backgrounds/linuxmint-olivia/linux_mint_{15,olivia}.png
}
