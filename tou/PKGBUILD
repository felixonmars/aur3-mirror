# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com> 
pkgname=tou
pkgver=1.0
pkgrel=1
pkgdesc="Tunnels Of the Underground (TOU) is a fast paced action side-view game with a good amount of weapons and space ships to choose from."
url="http://tou.has.it/"
arch=(i686 x86_64)
depends=()
[ "$CARCH" = i686   ] && depends=('wine')
[ "$CARCH" = x86_64 ] && depends=('bin32-wine')
source=(tou tou.desktop tou.png \
        http://doubleskill.de/svens_stuff/tou10.tar.gz)
license=('freeware')
#install=(tou.install)
noextract=()
#options=(!strip)
md5sums=('1b51595f6f34755d32cd74e631372aff' 
         '198cbf094416470fb8f3d81fa271cd74' 
         '5041dbdf8f54508212d6ffe1f65d2c11' 
         'b406cb160e67709a9c08e79dbab61a38')

build() {
	# Install documentation
	install -d -m755 ${pkgdir}/usr/share/doc/tou
	mv ${srcdir}/tou10/*.htm ${pkgdir}/usr/share/doc/tou
	mv ${srcdir}/tou10/helpgfx ${pkgdir}/usr/share/doc/tou/

	# Clean ${srcdir}
	rm ${srcdir}/tou10/uninstall*
	rmdir ${srcdir}/tou10/swap

	# Initial directories for game files
	install -d -m755 ${pkgdir}/usr/share/tou
	mv ${srcdir}/tou10/* ${pkgdir}/usr/share/tou/
	
	# Now lets manually change all the permissions since its a Windows game
	find ${pkgdir}/usr/share/tou -type d -exec chmod 755 "{}" \;
	find ${pkgdir}/usr/share/tou -type f -exec chmod 644 "{}" \;
	find ${pkgdir}/usr/share/doc/tou -type d -exec chmod 755 "{}" \;
	find ${pkgdir}/usr/share/doc/tou -type f -exec chmod 644 "{}" \;
	
	# Install scripts for the user to run
	install -d -m755 ${pkgdir}/usr/bin
	install -m755 tou ${pkgdir}/usr/bin

	# Install icon
	install -Dm644 ${srcdir}/tou.desktop ${pkgdir}/usr/share/applications/tou.desktop
	install -Dm644 ${srcdir}/tou.png ${pkgdir}/usr/share/pixmaps/tou.png
}
