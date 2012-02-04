# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com> 
pkgname=stargunner
pkgver=1.1
pkgrel=3
pkgdesc="DOS generation shoot-em-up game with pretty graphics and sound effects released for free by 3D Realms"
url="http://www.3drealms.com/stargunner/"
arch=('i686' 'x86_64')
depends=('dosbox')
makedepends=('p7zip')
source=(stargunner dosbox.conf \
        stargunner.desktop stargunner.png \
        ftp://ftp.3drealms.com/freeware/stargunnerfreeware.exe)
license=('freeware')
install=(stargunner.install)
noextract=()
#options=(!strip)
md5sums=('0a3097333751d8baab67b10ab68da9ff'
         '0d072a6403715504997c484843c1d0ed'
         'ca75cb6820073b75fdd86eac1f316b55'
         '582721d65cde5d1234eaa4177f1747e3'
         'b933e7009ceb88a3df6b641b99ab5db1')

build() {
	# Source file is .exe so we need to manually extract it
	7z e -ostargunnerfreeware $srcdir/stargunnerfreeware.exe &>/dev/null

	# Initial directories for game files
	install -d -m755 $pkgdir/usr/share/stargunner
	install -m755 dosbox.conf $pkgdir/usr/share/stargunner/dosbox.conf.dist
	mv $srcdir/stargunnerfreeware/* $pkgdir/usr/share/stargunner/
	
	# DOS game, so lets manually set permissions
	find $pkgdir/usr/share/stargunner -type d -exec chmod 755 "{}" \;
	find $pkgdir/usr/share/stargunner -type f -exec chmod 644 "{}" \;
	
	# Install script for the user to run
	install -d -m755 $pkgdir/usr/bin
	install -m755 $srcdir/stargunner $pkgdir/usr/bin

	# Install icon
	install -Dm644 ${srcdir}/stargunner.desktop ${pkgdir}/usr/share/applications/stargunner.desktop
	install -Dm644 ${srcdir}/stargunner.png ${pkgdir}/usr/share/pixmaps/stargunner.png
}
