# Maintainer: Xiaoxiao Pu <i@patme.net>

pkgname=ttygif
pkgver=1.0.8
pkgrel=2
pkgdesc="A tool that converts a ttyrec file into gif files."
arch=(i686 x86_64)
url="https://github.com/icholy/ttygif"
license=('MIT')
depends=('imagemagick' 'ttyrec')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/icholy/ttygif/archive/${pkgver}.tar.gz")
sha256sums=('32b3394ebaac3389c66aee225ab61846fc84b02e218d0018515a6e9345a9f114')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -Dm755 concat.sh ${pkgdir}/usr/bin/concat
}