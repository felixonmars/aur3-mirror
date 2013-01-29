# Contributor: twa022 
# Maintainer: twa022

pkgname=cinnamon-applet-windows7-menu
pkgver=1.3.1
pkgrel=1
pkgdesc="A Cinnamon menu that emulates the Win 7 start menu."
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/78"
license=('unknown')
groups=('cinnamon-applets')
depends=('cinnamon')
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/UVV9-O2TG-RTWU.zip"        
        'arch.patch')
	

package() {
	while [[ "X${_fm}" == 'X' ]] ; do 
		msg "Choose your preferred file manager:"
		msg2 "1) nemo"
		msg2 "2) nautilus"
		read -p ">> " _reply
		case "$_reply" in 
			1)
				depends+=( 'nemo-fm' )
				_fm='nemo'
				;;			
			2)
				depends+=( 'nautilus' )
				_fm='nautilus'
				;;
			*)
				error "NOT A VALID REPLY"
				sleep 1s
				;;
		esac
	done

	cd ${srcdir}
	patch -Np0 -i ./arch.patch
	find cinnamon7Menu@physics/ -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;
	case "$_fm" in 
		nautilus)
			sed -i 's:nemo:nautilus:g' "$pkgdir"/usr/share/cinnamon/applets/*/*
			;;
	esac
}

sha256sums=('3d44819b027a2873492950a581fe255f2524960734c4a92dfda53b0132a4c11f'
            '7e597437ee9c92962c5faf5ec0acefcd0e4feb8cfa83c0b01eaf08c3b839cde8')
