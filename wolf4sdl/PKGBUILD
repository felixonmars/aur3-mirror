# Maintainer : chris_L <chrislcenter dash mamoru at yahoo.com dot mx>
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: David Houston <cranky@archlinux.us>

pkgname=wolf4sdl
pkgver=1.7
pkgrel=1
pkgdesc='An enhanced SDL port of the FPS "Wolfenstein 3D" by id Software (You need the retail game files to play)'
arch=('i686' 'x86_64')
url="http://www.chaos-software.de.vu/"
license=('custom')
depends=('sdl_mixer' 'gcc-libs')
conflicts=('wolf4sdl-shareware')
install=$pkgname.install
source=(http://www.alice-dsl.net/mkroll/bins/Wolf4SDL-1.7-src.zip)
md5sums=('303f340598bfbe3440523c1ddb9f52e8')

build() {
	cd Wolf4SDL-$pkgver-src
	# By default, it expects the GT/ID/Activision 1.4 full version files, 
	# uncomment one of the following lines if you got errors about numchecks and you are not using a mod
	# sed -i -e 's/#define GOODTIMES/\/\/&/' -e 's/\/\/\(#define APOGEE_1_1\)/\1/' version.h # uncoment this line if you have the v1.1 apogee full version
	# sed -i -e 's/#define GOODTIMES/\/\/&/' version.h # uncoment this line if you have the v1.4 apogee full version


	# sed lines to make it use /usr/share/wolf3d for data files
	find -type f |xargs -I file sed -i 's/"\([a-z0-9][a-z0-9]*\.wl[1-9]\)/"\/usr\/share\/wolf3d\/\1/g' file
	sed -i 's/\(\[\].*\)"\([a-z0-9][a-z0-9]*\.\)"/\1"\/usr\/share\/wolf3d\/\2"/g' id_ca.cpp
	sed -i 's/\(strcpy(fname, "\)\(gamemaps."\)/\1\/usr\/share\/wolf3d\/\2/' id_ca.cpp
	sed -i 's/^.*fname\[13\] = "vswap\..*/static const char gvswap\[\] = "\/usr\/share\/wolf3d\/vswap."; char fname\[\]=""; strcpy(fname,gvswap);/' id_pm.cpp
	sed -i 's/if(!stat("vswap.wl\([0-9]\)", &statbuf))/if(!stat("\/usr\/share\/wolf3d\/vswap.wl\1", \&statbuf))/' wl_menu.cpp


	make BINARY=$pkgname
	make PREFIX="$pkgdir"/usr BINARY=$pkgname install

	mkdir -p "$pkgdir"/usr/share/{wolf3d,licenses/$pkgname}
	install -m644 license*.txt "$pkgdir"/usr/share/licenses/$pkgname/
}

