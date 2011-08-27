# Contributor: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

# Freecraft is deprecated and you should use stratagus with wargus ( http://wargus.sourceforge.net/ ) instead!
# Biggest difference from wargus is that you don't need original Warcraft 2 game to play Freecraft.

# TODO:
# - unsure about dependencies

pkgname=freecraft
pkgver=1.19
pkgrel=1
fcmpver=1.18.20030311
pkgdesc="Warcraft2 clone - now deprecated and replaced by Stratagus/Wargus. You can also play Original WarCraft 1 or 2 in DosBox. But you don't need files from original W2 to play FreeCraft!"
arch=('i686' 'x86_64')
license=('GPL')
url="http://git.comum.org/gitweb.cgi?p=lincoln/debian/freecraft.git"
depends=(
	'libxext' 'bzip2' 'libpng' 'sdl' 'libx11' 'zlib'
	# 'evas-svn'
	# 'svgalib-helper' 'svgalib' 'svgalib-devel'
)

source=(
	"http://ftp.debian.org/debian/pool/main/f/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
	"http://ftp.debian.org/debian/pool/main/f/${pkgname}/${pkgname}_${pkgver}-3.debian.tar.gz"
	"http://ftp.debian.org/debian/pool/main/f/fcmp/fcmp_${fcmpver}.orig.tar.gz"
)

md5sums=('bc7bf78c921bf2e612190e0a4398b210'
         'afc399763ad26225378c88427d64da78'
         'b770c20b2088687d81116f1361d2193d')

build() {
  mkdir -p ${pkgdir}/usr/local
  mkdir -p ${pkgdir}/usr/share/games/freecraft/default/

	cd ${srcdir}

	#Apply debian patch (which contains more patches xD)
	#patch -p0 < freecraft_${pkgver}-4.diff

	cd ${srcdir}/${pkgname}-${pkgver}/

	#Apply Debian patches ;o)
	#for i in $(cat ./debian/patches/00list); do
	#	bash "./debian/patches/$i.dpatch" -patch
	#done;

	#Copy data from freecraft & fcmp
	#cp -r ${srcdir}/${pkgname}-${pkgver}/data/* ${pkgdir}/usr/share/games/freecraft/
	cp -r ${srcdir}/fcmp-${fcmpver}/data/* ${pkgdir}/usr/share/games/freecraft/default/

	#Compile
	#./setup || return 1
	./configure --prefix="${pkgdir}/usr/" || return 1
	make install PREFIX="${pkgdir}/usr/" || return 1

	#Launcher
	#mkdir -p ${pkgdir}/usr/bin
	#echo '#!/bin/sh
	#/usr/games/freecraft $@' > ${pkgdir}/usr/bin/${pkgname}
	#chmod -R 655 ${pkgdir}/usr/bin/${pkgname}

#	mkdir -p ${pkgdir}/usr/share/applications
#	#Desktop Launcher
#	echo '[Desktop Entry]
#Version=1.0
#Encoding=UTF-8
#Name=FreeCraft
#GenericName=FreeCraft
#Comment=Warcraft 2 style real-time strategy game
#Exec=/usr/games/freecraft
#Icon=freecraft
#StartupNotify=true
#Terminal=false
#Type=Application
#Categories=Game;' > ${pkgdir}/usr/share/applications/freecraft.desktop

}
