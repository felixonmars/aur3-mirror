# Contributors: flareguner <flareguner(at)gmail.com>

pkgname=twofing-git
pkgver=0.0.9999
pkgrel=1
pkgdesc="twofing is a daemon which runs in the background and recognizes two-finger gestures performed on a touchscreen and converts them into mouse and keyboard events. This is the original edition with udev rules for Eee Pc T101MT"
arch=('i686' 'x86_64')
url="http://philmerk.de/arbeit/useful_twofing.htm"
depends=('git' 'udev' 'libxtst' 'libxrandr')
makedepends=('sed' 'libxi' 'inputproto')
options=()
license=('custom')
source=()
#sha1sums=('d2d8722025352007a46a139b7ce469d1aa146b90')


_giturl='https://github.com/Plippo/twofing.git'



build() {


	cd "${srcdir}"
	
	git clone ${_giturl} ${pkgname} 
	
	cd "${srcdir}/${pkgname}"
	make
}
package() {
	cd "${srcdir}/${pkgname}"
	mkdir -p ${pkgdir}/usr/bin
 	mkdir -p ${pkgdir}/etc/udev/rules.d/
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

	echo "SUBSYSTEMS=="usb",ACTION=="add",KERNEL=="event*",SYSFS{idProduct}=="0186",SYMLINK+="twofingtouch",RUN+="/bin/chmod a+r /dev/twofingtouch"" > "${srcdir}/70-touchscreen-egalax.rules"
	
	make DESTDIR="${pkgdir}" install
	install -m644 70-touchscreen-egalax.rules "${pkgdir}/etc/udev/rules.d/"
	cat twofingemu.c | head -n 15 > "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
