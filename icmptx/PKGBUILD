# Contributor: virtuemood <virtue@archlinux.us>
pkgname=icmptx
pkgver=0.2
pkgrel=1
license=GPL
pkgdesc="icmptx mkroli's branch, ICMPTX is a program that allows a user with root privledges to create a virtual network link between two computers, encapsulating data inside of ICMP packets."
arch=('i686' 'x86_64')
url=https://github.com/mkroli/icmptx/
source=("https://github.com/mkroli/icmptx/archive/1e5179a1d47b9ba6106a8aa373c7f739c289ac85.zip")


build() {
	cd icmptx*
	make
}
package(){
	cd icmptx*
	mkdir -p $pkgdir/usr/bin
	mv icmptx $pkgdir/usr/bin
}

md5sums=('250d88dcebbe6c9bc5b7f5a619a4a697')
