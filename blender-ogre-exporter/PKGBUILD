# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=blender-ogre-exporter
pkgver=1.4
pkgrel=1
pkgdesc="Blender-integrated exporter for exporting OGRE meshes"
arch=('i686' 'x86_64')
url="http://www.ogre3d.org/wiki/index.php/OGRE_Meshes_Exporter"
depends=('python' 'blender' 'ogre')
license=('GPL')
install=blender-ogre-exporter.install
source=("http://www.xullum.net/lefthand/downloads/temp/BlenderExport.zip")
md5sums=('9a1791ff9d6b29e71285e2d34c230986')

build() {
	mkdir -p ${pkgdir}/usr/share/blender/scripts/
	cp -r ${srcdir}/{ogrehelp,ogrepkg,ogremeshesexporter.py} ${pkgdir}/usr/share/blender/scripts/
}
