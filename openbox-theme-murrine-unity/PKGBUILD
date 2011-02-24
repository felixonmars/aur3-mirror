# Contributor: Tony Upton <celticmusicguy at gmail dot com>

pkgname=openbox-theme-murrine-unity
pkgver=20110222
pkgrel=1
pkgdesc="A clean and simple Openbox theme intended to go with the Murrine-Unity GTK theme"
arch=('i686' 'x86_64')
url="http://code.google.com/p/murrine-unity-project/"
license=('GPL')
depends=('openbox')
source=('http://murrine-unity-project.googlecode.com/files/Murrine-Unity-OB3-20110222-src.tar.gz')
md5sums=('bd199bb4cc8f05afb5424959d36a121d')

build() {
	cd ${srcdir}
	install -d -m755 ${pkgdir}/usr/share/themes || return 1
	cp -rf Murrine-Unity ${pkgdir}/usr/share/themes || return 1
}


