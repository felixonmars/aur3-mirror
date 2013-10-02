# Maintainer: Alfonso Saaverda "Son Link" <sonlink.dourden@gmail.com>

pkgname=donkeyme-the-lost-ark
pkgver=1.0
pkgrel=1
pkgdesc="A Donkey Kong game whit grafics ispired on the movie Indiana Jones: Raiders of the Lost Ark"
arch=('i686' 'x86_64')
url=('http://www.bruneras.com/games_donkeyme.php')
license=('FREE')
depends=()
arch=('x86_64' 'i686')
source=('https://dl.dropboxusercontent.com/u/58286032/aur/DonkeyMe_Raiders_of_the_Lost_Ark.zip'
	${pkgname}.png ${pkgname}.desktop)
md5sums=('37bdb3d60f1a8ad1631a28dcfe2a7d7b'
         '23360dd4e532bb12ba66d9d42185d7b3'
         'c7ec555ae9c0ec0e423e16cf36299b99')

package() {
	cd "${srcdir}/DonkeyMe_Raiders"
	mkdir -p ${pkgdir}/usr/bin
	echo "#!/bin/bash" > $pkgdir/usr/bin/$pkgname
	echo "cd /opt/$pkgname/ && ./runner" >> $pkgdir/usr/bin/$pkgname
	chmod 755 $pkgdir/usr/bin/$pkgname
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp * -r ${pkgdir}/opt/${pkgname}
	chmod -R 655  ${pkgdir}/opt/${pkgname}/runner
	mkdir -p ${pkgdir}/usr/share/icons
	mkdir -p ${pkgdir}/usr/share/applications/
	install -m 644 "${srcdir}/${pkgname}.png"  ${pkgdir}/usr/share/icons
	install -m 644 "${srcdir}/${pkgname}.desktop"  ${pkgdir}/usr/share/applications
}

