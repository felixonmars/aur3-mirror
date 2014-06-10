
# Maintainer: Dany Martineau <dany.luc.martineau at gmail.com>

pkgname=wiimotewhiteboard  
pkgver=1.0.3
pkgrel=2
url="http://www.uweschmidt.org/wiimote-whiteboard"
pkgdesc="Allows you to use the Wii Remote (Wiimote) to turn any surface into a Low-Cost Interactive Whiteboard."
arch=('any')
license=('GPL')
depends=('java-runtime' 'bluez-libs')
makedepends=('zip')
source=(http://www.uweschmidt.org/files/WiimoteWhiteboard.zip \
        http://bluecove.googlecode.com/files/bluecove-gpl-2.1.0.jar wiimotewhiteboard.desktop)
md5sums=('5e098dcb3112fa416d221ccd13379485'
         '78304a5e7f8913d561b67ff9d17ef4de'
         'b7490a3ca49253a63fcee1dd2ecf35e6')

build() {
	echo "building"
}
package(){

	mkdir -p ${pkgdir}/usr/share/WiimoteWhiteboard
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/lib

	if [[ $CARCH == "i686" ]] 
	then
		install -m755 ${srcdir}/libbluecove.so ${pkgdir}/usr/lib
		echo $ARCH
	fi
	if [[ $CARCH == "x86_64" ]] 
	then
		install -m755 ${srcdir}/libbluecove_x64.so ${pkgdir}/usr/lib
		echo $ARCH
	fi
	install -m755 ${srcdir}/WiimoteWhiteboard/WiimoteWhiteboard.sh ${pkgdir}/usr/bin
	install -m75 ${srcdir}/WiimoteWhiteboard/WiimoteWhiteboard.jar ${pkgdir}/usr/share/WiimoteWhiteboard
	echo "java -jar ${pkgdir}/usr/share/WiimoteWhiteboard/WiimoteWhiteboard.jar" > ${pkgdir}/usr/bin/WiimoteWhiteboard.sh
	install -Dm755 $srcdir/wiimotewhiteboard.desktop \
        $pkgdir/usr/share/applications/wiimotewhiteboard.desktop || return 1
} 
