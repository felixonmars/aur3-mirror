# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=bsh
pkgver=2.0b4
pkgrel=2
pkgdesc="Small, free, embeddable, source level Java interpreter with object based scripting language features"
arch=('i686' 'x86_64')
url="http://www.beanshell.org"
license=('LGPL')
depends=('java-environment')
source=(${url}/${pkgname}-${pkgver}.jar bsh-bin bsh-bin-gui bsh.desktop bsh-gui.desktop beany.png)
noextract=(${pkgname}-${pkgver}.jar)
md5sums=('a1c60aa83c9c9a6cb2391c1c1b85eb00'
         'dbe4ec8502b485767732fa281714f19b'
         'aa35776548f62b8a421afd66afbe146e'
         '3d65741f5fc63180751484e054460d54'
         '44eba77c1245d231d808c06240878ada'
         'e8e803634e8bde37a4a2289201bf4b12')
sha256sums=('91395c07885839a8c6986d5b7c577cd9bacf01bf129c89141f35e8ea858427b6'
            'bd36309978e1eadfa1f3a4e0c63e9ef2ea57ccc26ec5894c1c41b35d1d700bba'
            'a6e89587d0cca35e918bce05e6ec92a865cc159be46dee901d8c5ed51d9b860c'
            '745a86d675368c6a801c13e43d7441d1d90e335440e65ce644fd4a8213349d18'
            '9ea22d0dbe491d74e6d1a2f5cc0763e4f3929e6ede39dfe9012122d1d236ea40'
            'f2514cab7caac4292b63e20d42bc5c7f46e62e655f71b2ae9bc2c7a88b3dd49e')

build() {
	mkdir -p ${pkgdir}/usr/bin/ ${pkgdir}/usr/share/{applications,java,pixmaps}
	install -m644 ${srcdir}/${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}.jar
	install -m755 ${srcdir}/${pkgname}-bin ${pkgdir}/usr/bin/${pkgname}
	install -m755 ${srcdir}/${pkgname}-bin-gui ${pkgdir}/usr/bin/${pkgname}-gui
	install -m644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications
	install -m644 ${srcdir}/${pkgname}-gui.desktop ${pkgdir}/usr/share/applications
	install -m644 ${srcdir}/beany.png ${pkgdir}/usr/share/pixmaps
}
