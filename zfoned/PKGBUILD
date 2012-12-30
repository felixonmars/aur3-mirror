pkgname=zfoned
pkgver=0.92.246
pkgrel=1
pkgdesc="Zfone is software for secure voice communication over the Internet (VoIP), using the ZRTP protocol"
url="http://zfoneproject.com"
arch=('i686' 'x86_64')
license=("custom:Copyright Philip Zimmermann")
depends=('libzrtp' 'iptables')
makedepends=('automake' 'autoconf' 'linux-lts-headers')
source=('http://wakusi.de/download/zfone-linux.tar'
	'zfoned.service')
sha512sums=('1feda208fea9d7050f15822a0f8aba9cd1d521a5e41c0ec62e48b733be83d38ce8a7419a2556dd5b7c564142a6fe9b1d42a465a98f01c0e449bde2de76dd3eca'
	'3eb20cdf7c3fce775c213039e3187f22a0a776d72907957910b9b8036eadeedc3424275af289caef1c4420058f2c792d823c29e368d8f408ea1e906fc9de052e')

build () {
	cd $srcdir/zfone-linux
	tar --strip-components=1 -zxvf ./zfoned-$pkgver.tar.gz
	./cfg
	make
}
package() {
	cd $srcdir/zfone-linux
	sed -i 's/prefix = \/usr\/local/prefix = ${DESTDIR}\/usr\/local/' resources/Makefile
	make DESTDIR="$pkgdir" install

	# Create service file
	install -Dm 644 "${srcdir}/zfoned.service" "${pkgdir}/usr/lib/systemd/system/zfoned.service"
}
