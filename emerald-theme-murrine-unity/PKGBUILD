# Contributor: Tony Upton <celticmusicguy at gmail dot com>

pkgname=emerald-theme-murrine-unity
pkgver=20110222
pkgrel=1
pkgdesc="A clean and simple Emerald theme intended to go with the Murrine-Unity GTK theme"
arch=('i686' 'x86_64')
url="http://code.google.com/p/murrine-unity-project/"
license=('GPL')
depends=('emerald')
source=('http://murrine-unity-project.googlecode.com/files/Murrine-Unity-Emerald-20110222-src.tar.gz')
md5sums=('81799d471513f4ba77ba9ea099b848dd')

build() {
	cd ${srcdir}
	install -d -m755 ${pkgdir}/usr/share/emerald/themes || return 1
	cp -rf Murrine-Unity ${pkgdir}/usr/share/emerald/themes || return 1
}


