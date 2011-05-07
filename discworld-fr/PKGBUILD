# Maintainer: Toutoul <labstag@gmail.com>
pkgname=discworld-fr
pkgver=1.0
pkgrel=1
pkgdesc="French version of Discworld to SCUMMVM"
arch=('i686' 'x86_64')
url="http://www.scummvm.org"
license=('GPL2')
groups=()
depends=('scummvm' 'p7zip')
makedepends=()
install=
changelog=
source=('http://www.abandonware-france.org/ltf_abandon/clic.php?idtele=1572' 'icon.jpg') 
md5sums=('6680bb6eb541c5941815a955f02237f9' '038f2e32f04b09d1b157a1a2d14e5b68')
noextract=()
build(){
	cd "${srcdir}/"
	7z x clic.php?idtele=1572
	mkdir -p -m755  "${pkgdir}/opt/scummvm/"
	mkdir -p -m755  "${pkgdir}/opt/scummvm/${pkgname}/"
	cp -ar Discwld/*   "${pkgdir}/opt/scummvm/${pkgname}/"
	chmod -R 755 "${pkgdir}/opt/scummvm/${pkgname}/"
	# Exec file
	printf "#!/bin/sh
mkdir ~/.scummvm/
scummvm -F --savepath=~/.scummvm/ --path=/opt/scummvm/${pkgname}/ dw" >> "${srcdir}/exec.sh"
	chmod +x "${srcdir}/exec.sh"
	install -Dm755 "${srcdir}/exec.sh" "${pkgdir}/usr/bin/${pkgname}"
	# Desktop icon
	install -Dm644 icon.jpg "${pkgdir}/usr/share/pixmaps/${pkgname}.jpg"
	printf "[Desktop Entry]
Version=${pkgver}
Type=Application
Name=Discworld
Comment=${pkgdesc}
Exec=/usr/bin/${pkgname}
Icon=/usr/share/pixmaps/${pkgname}.jpg
Categories=Game;
Terminal=false
StartupNotify=false" >> "${srcdir}/fichier.desktop"
	install -Dm755 "${srcdir}/fichier.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

