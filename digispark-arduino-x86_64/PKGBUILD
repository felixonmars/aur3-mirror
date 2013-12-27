# Maintainer: mugifly <mp at ohgita dot info>
pkgname=digispark-arduino-x86_64
_basearduinover="1.0.4"
_packageverstr="${_basearduinover}-May19"
pkgver="${_basearduinover}May19"
pkgrel=1
pkgdesc="A software for digispark with using Arduino IDE"
arch=('x86_64')
url="http://digistump.com/wiki/digispark/tutorials/connecting"
license=('custom')
depends=('libusbx' 'arduino')
source=("http://downloads.sourceforge.net/digistump/DigisparkArduino-Linux64-${_packageverstr}.tar.gz" LICENSE)
md5sums=('c6e432effd29a2fb690aaca2e6a29b9a' '3151388c305a699d090dd909a4a120f8')

package() {
	cd "$srcdir/DigisparkArduino-Linux64/"
	# Udev rule
	mkdir -p ${pkgdir}/etc/udev/rules.d/
	cp 90-digispark.rules ${pkgdir}/etc/udev/rules.d/
	# DigiUSB programs
	mkdir -p ${pkgdir}/usr/bin
	cp DigiUSB_Programs/send ${pkgdir}/usr/bin/
	cp DigiUSB_Programs/receive ${pkgdir}/usr/bin/
	cp DigiUSB_Programs/digiusb ${pkgdir}/usr/bin/
	# Arduino files
	mkdir -p "${pkgdir}/usr/share/arduino/examples/"
	mkdir -p "${pkgdir}/usr/share/arduino/hardware/"
	mkdir -p "${pkgdir}/usr/share/arduino/libraries/"
	cp "Digispark-Arduino-${_basearduinover}/examples/Digispark_Examples" "${pkgdir}/usr/share/arduino/examples/Digispark_Examples/" -r
	cp "Digispark-Arduino-${_basearduinover}/hardware/digispark" "${pkgdir}/usr/share/arduino/hardware/digispark/" -r
	cp Digispark-Arduino-${_basearduinover}/libraries/Digispark* "${pkgdir}/usr/share/arduino/libraries/" -r
	# License
	install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

