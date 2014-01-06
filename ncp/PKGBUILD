# Contributor: Kilian Kempf <arch@kfk-net.de>
pkgname=ncp
pkgver=1.2.4
pkgrel=3
pkgdesc="A fast file copy tool for LANs"
arch=('i686' 'x86_64')
url="http://www.fefe.de/ncp/"
license=('GPL')
depends=('tar')
makedepends=('libowfat')
source=(http://dl.fefe.de/$pkgname-$pkgver.tar.bz2 \
	$pkgname-${pkgver}_version-string.patch)
md5sums=('421c4855bd3148b7d0a4342942b4bf13' \
	 '226232f69a28442aac9edf99a4991d52')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# update the internal version string
	patch -Np1 -i ../${pkgname}-${pkgver}_version-string.patch || return 1
	# build ncp (fixing executable stack)
	make LDFLAGS="-s -lowfat -Wl,-z,noexecstack" || return 1
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# install ncp
	make PREFIX="${pkgdir}/usr" install
	# move manpages
	mkdir "${pkgdir}/usr/share"
	mv "${pkgdir}/usr/man"  "${pkgdir}/usr/share"
}
