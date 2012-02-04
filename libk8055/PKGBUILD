# Maintainer: Bernd Amend <berndamend web de>

pkgname=libk8055
pkgver=0.4.1
pkgrel=1
pkgdesc="Userspace usb driver and api for the Velleman K8055 USB Board"
arch=('i686' 'x86_64')
url="http://${pkgname}.sourceforge.net/"
license=('LGPL')

# for the moment we keep the old udev rules file
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}.0.4/${pkgname}.${pkgver}.tar.gz"
		70-libk8055.rules)

sha1sums=('a64f064e0aa32c8c8b6df43faba780d347f8844a'
          '733a6088c506ba5fbf535a7ce1d6dadf6172976d')

build() {
	cd "${srcdir}/src"
	
	# compile library
	gcc -O2 -DDAEMON -DVERSION='"0.4.1"' -Wall -c -g -fPIC ${pkgname}.c
	gcc -o ${pkgname}.so -lusb -shared ${pkgname}.o

	# build the program
	gcc main.c -o k8055 -L. -lk8055 -lm

	install -d -m755 "${pkgdir}/usr/share/man/man1/" "${pkgdir}/usr/include/" "${pkgdir}/usr/lib/" "${pkgdir}/usr/bin/" "${pkgdir}/lib/udev/rules.d/"

	install -m644 man/k8055.1.gz "${pkgdir}/usr/share/man/man1/"
	install -m644 k8055.h "${pkgdir}/usr/include/"
	install -m644 "${srcdir}/70-libk8055.rules" "${pkgdir}/lib/udev/rules.d/"
	install -m755 ${pkgname}.so "${pkgdir}/usr/lib/"
	install -m755 k8055 "${pkgdir}/usr/bin/"

	cd "${pkgdir}/usr/lib"
	ln -s ${pkgname}.so ${pkgname}.so.0.4
	ln -s ${pkgname}.so ${pkgname}.so.${pkgver}
}

