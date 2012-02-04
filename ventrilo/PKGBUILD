# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com> 
pkgname=ventrilo
pkgver=3.0.5
pkgrel=1
pkgdesc="voice comm for games and group discussions"
url="http://www.ventrilo.com/"
arch=('i686' 'x86_64')
depends=()
[ "$CARCH" = i686   ] && depends=('wine')
[ "$CARCH" = x86_64 ] && depends=('bin32-wine')
makedepends=('p7zip' 'lynx')
install=ventrilo.install
source=(http://ftp.uni-kl.de/pub/mplayer/releases/codecs/win32codecs-essential-20040703.tar.bz2 \
		ventrilo ventrilo.desktop ventrilo.png ventrilo.install)
license=('custom')
noextract=()
#options=(!strip)
md5sums=('58ce4d68001d4f39c3e84d52834fb3ef' 
         '14540b84d4f65f15baee6b42efc623ad'
         '77a7dff56b8dd430f22428952cfff633'
         '6953f4453e9f061c125421d8a2b7ea19'
         'f9f9be1a01d11d72fbd51d225605d79f')

build() {
	### WE NEED TO DOWNLOAD THE CLIENT MANUALLY BECAUSE OF THE LICENSE ###
	msg "Because of its license, the Ventrilo client needs to be download manually"
	msg "For this purpose, I will now open a text web browser at ventrilo.com to download the client"
	msg "You need to: 1) Read the license 2) Scroll down to 'I Agree' 3) Save the file with the default name 4) Close the browser (press Q)"
	msg "Press a key to open ventrilo.com"
	read -n 1 -s
	lynx -cookies off http://www.ventrilo.com/dlprod.php?id=1
	
	if [ ! -f ventrilo-${pkgver}-Windows-i386.exe ]; then 
		msg "ventrilo-${pkgver}-Windows-i386.exe missing, aborting..."
		exit 1
	fi

	# Woah, if somebody really got this far, the client will actually be
	# extracted here
	7z e ventrilo-${pkgver}-Windows-i386.exe -ovent

	# Install binaries
	install -d -m755 ${pkgdir}/usr/share/ventrilo
	install -d -m755 ${pkgdir}/usr/share/doc/ventrilo
	mv ${srcdir}/vent/Ventrilo.exe1 ${pkgdir}/usr/share/ventrilo/ventrilo.exe
	mv ${srcdir}/vent/{*.wav,default.vet} ${pkgdir}/usr/share/ventrilo/
	mv ${srcdir}/vent/* ${pkgdir}/usr/share/doc/ventrilo/
	mv ${srcdir}/win32codecs-essential-20040703/msgsm32.acm ${pkgdir}/usr/share/ventrilo/

	# Windows app, so lets manually set permissions
	find ${pkgdir}/usr/share/ventrilo -type d -exec chmod 755 "{}" \;
	find ${pkgdir}/usr/share/ventrilo -type f -exec chmod 644 "{}" \;
	find ${pkgdir}/usr/share/doc/ventrilo -type d -exec chmod 755 "{}" \;
	find ${pkgdir}/usr/share/doc/ventrilo -type f -exec chmod 644 "{}" \;
	
	# Install scripts for the user to run
	install -d -m755 ${pkgdir}/usr/bin
	install -m755 ventrilo ${pkgdir}/usr/bin

	# Install icon
	install -Dm644 ${srcdir}/ventrilo.desktop ${pkgdir}/usr/share/applications/ventrilo.desktop
	install -Dm644 ${srcdir}/ventrilo.png ${pkgdir}/usr/share/pixmaps/ventrilo.png
}
