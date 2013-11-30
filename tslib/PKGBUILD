# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=tslib
pkgver=1.1
pkgrel=1
pkgdesc="tslib TouchScreen Library"
arch=('arm' 'i686' 'x86_64')
license=('custom')
url="http://tslib.berlios.de/"
depends=('xorg-server')
makedepends=('git')
options=('!libtool')
groups=('xorg-drivers' 'xorg')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/kergoth/tslib/tar.gz/${pkgver}")
sha256sums=('121750e9ae0f05ce840ab8dbefdae1297258f0a69dd1967f55c40ac6e87d5ee9')

build() {
	cd ${pkgname}-${pkgver}/

	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}
