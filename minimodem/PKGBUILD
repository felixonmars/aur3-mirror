# $Id: PKGBUILD 162329 2012-06-25 09:10:55Z pierre $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>
# Contributor: François Charette <firmicus@gmx.net>

pkgname=minimodem
pkgver=0.16.1
pkgrel=2
pkgdesc='A tool to (de)code modem audio'
arch=('i686' 'x86_64')
url='http://www.whence.com/minimodem/'
license=('GPL')
depends=()
optdepends=('libpulse' 'alsa-lib')
makedepends=('libpulse' 'alsa-lib')
source=("http://www.whence.com/${pkgname}/${pkgname}-${pkgver}.tar.gz")

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

check() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make check
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
sha512sums=('896c7368aa668d49e9135d306be35f32013726feb72cd7b24cd921be14354a0d0ecbaa484cb8009cd7faf5b1b8f4fdeb31ec89f4e8a6b0533ca4d9ac5cc03f7d')
