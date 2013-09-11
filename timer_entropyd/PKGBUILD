# Maintainer: fauno <fauno@parabola.nu>
pkgname=timer_entropyd
pkgver=0.2
pkgrel=1
pkgdesc="Feeds the /dev/random device with entropy-data (random values) read from timers."
arch=('i686')
url="http://www.vanheusden.com/te/"
license=('GPL2')
groups=('entropy')
source=(http://www.vanheusden.com/te/${pkgname}-${pkgver}.tgz
        ${pkgname}.service)
sha1sums=('61b82128bf4df483271a475a0cc772a7fd80a804'
          '96ff193aef61088759cf9d9c9d0e881fd1174824')
sha256sums=('0cf2b976b78c1b1169a4bec5a6fc71d8b118de927bc05002686376a61f73989a'
            'a22d33d99ab7c511902a37225e83476466840bd4c0ee3ffece1e4094511414de')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

  install -D -m 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -D -m 644 ${srcdir}/${pkgname}.service \
                    ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}
