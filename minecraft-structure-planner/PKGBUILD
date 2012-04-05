# Contributor: Dirk Sohler <spam@0x7be.de>               
# Maintainer: Dirk Sohler <spam@0x7be.de>


pkgname='minecraft-structure-planner'
pkgver='v0.99.7'
pkgrel=3
pkgdesc='Plan structures for Minecraft … Or just draw some pixel art'


url='http://minecraftstructureplanner.com'
arch=('i686' 'x86_64')
license=('custom:freeware')
depends=('java-runtime')
optdepends=('mcedit: import exported schematic files'
	    'minecraft: build the created structures')


md5sums=('19af56a709951c08a782c8f386309b72'
         'ef076706476da2ef2307603a24efe5c9'
	 '0e2902627c8030b9447ae14b3e06dc1d'
	 '23871ad82b579674422effe0529e6fa2')
source=('http://minecraftstructureplanner.com/download/MinecraftStructurePlanner.jar'
	'minecraft-structure-planner.desktop'
	'minecraft-structure-planner'
	'minecraft-structure-planner.png')
noextract=('http://minecraftstructureplanner.com/download/MinecraftStructurePlanner.jar')


build() {
  cd $srcdir || return 1
  install -D -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/MinecraftStructurePlanner.jar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.jar"
  install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
