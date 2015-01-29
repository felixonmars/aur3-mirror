# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=xllmnrd
pkgver=2.0
pkgrel=1
pkgdesc='A minimal IPv6 LLMNR responder daemon'
arch=('i686' 'x86_64')
url="http://xllmnrd.vx68k.org/"
license=('GPL3')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/xllmnrd/${pkgver}/xllmnrd-${pkgver}.tar.gz"
        "xllmnrd.service")
sha1sums=('40b34ec78e1aca83b9e11efd360c5e602e67b01c'
          'f2ac5fc94d1480ebf0cade4c4bba38b53c2ccba7')

build() {
	cd "${srcdir}/xllmnrd-${pkgver}"
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/xllmnrd-${pkgver}"
	make DESTDIR="$pkgdir" install
	install -Dm0644 "${srcdir}/xllmnrd.service" \
			"${pkgdir}/usr/lib/systemd/system/xllmnrd.service"
}
