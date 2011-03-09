# Maintainer: KosmosElohim  ***jbdsjunior@live.com***

pkgname=faenza-fusion-icon-theme
pkgver=0.8
pkgrel=1
pkgdesc="fusion icon theme of the famous Icon theme Faenza designed for Equinox GTK theme"
url="http://opendesktop.org/content/show.php/Faenza+icon+theme+for+Kde4?content=132988"
license=('GPL3')
arch=('any')
makedepends=()
source=("http://ompldr.org/vNW9iMg/C--Documents%20and%20Settings-giovanni.santoni-Desktop-Faenza-kde4-0.6.tar.gz"
	"http://gnome-look.org/CONTENT/content-files/129008-Faenza-Cupertino.tar.gz"
	"http://gnome-look.org/CONTENT/content-files/133677-Faenza-Cupertino-Dark.tar.gz")
sha256sums=('b8df236f95819d23a630838197d741b63a250974a61b545c038908df0502e881'
	'dcab63c87fb901b949f53abaebf73aa886e59b570345226da303c238b02c988e'
	'3514c3ab0caa303282241dab669659076a684248f5893ad782ab5380039f1331')

build() {
        mkdir -p "${pkgdir}"/usr/share/icons
	cp -r -a -f Faenza/  "${pkgdir}"/usr/share/icons/
	cp -r -a -f Faenza-Cupertino/.  "${pkgdir}"/usr/share/icons/Faenza/

	cp -r -a -f Faenza-Dark-Panel/.  "${pkgdir}"/usr/share/icons/Faenza-Dark-Colors/
	cp -r -a -f Faenza-Dark-Colors/.  "${pkgdir}"/usr/share/icons/Faenza-Dark-Colors/
	cp -r -a -f Faenza-Cupertino-Dark/.  "${pkgdir}"/usr/share/icons/Faenza-Dark-Colors/

	cp -r -a -f Faenza/index.theme  "${pkgdir}"/usr/share/icons/Faenza/index.theme
	cp -r -a -f Faenza-Dark-Colors/index.theme  "${pkgdir}"/usr/share/icons/Faenza-Dark-Colors/index.theme

# set the Arch Linux Dristributor logo
        for size in 16 22 24 32 48 64 128 256; do
		cd "${pkgdir}"/usr/share/icons/Faenza/places/$size
		ln -sf ./distributor-logo-archlinux.png distributor-logo.png
        done;

# set the Arch Linux start menu logo
        for size in 16 22 24 32 48 64 128 256; do
		cd "${pkgdir}"/usr/share/icons/Faenza/places/$size
		ln -sf ./distributor-logo-archlinux.png start-here.png
        done;

# set the preferences icons
        for size in 16 22 24 32 48 64 128 256; do
		cd "${pkgdir}"/usr/share/icons/Faenza/apps/$size
		ln -sf ./nautilus.png system-file-manager.png
		ln -sf ./gnome-volume-control.png multimedia-volume-control.png
        done;

# set the Arch Linux start menu logo
        for size in 16 22 24 32 48; do
		cd "${pkgdir}"/usr/share/icons/Faenza/places/$size
		ln -sf /usr/share/icons/Faenza/places/$size/distributor-logo-archlinux.png "${pkgdir}"/usr/share/icons/Faenza-Dark-Colors/places/$size/start-here.png
        done;

        cd "${pkgdir}"/usr/share/icons/Faenza/places/scalable
        ln -sf ./distributor-logo-archlinux.svg distributor-logo.svg
	ln -sf ./distributor-logo-archlinux.svg start-here.svg

	cd "${pkgdir}"/usr/share/icons/Faenza-Dark-Colors/places/scalable
	ln -sf /usr/share/icons/Faenza/places/scalable/distributor-logo-archlinux.svg "${pkgdir}"/usr/share/icons/Faenza-Dark-Colors/places/scalable/start-here.svg

 	chown -R root:root "${pkgdir}"/usr
}
