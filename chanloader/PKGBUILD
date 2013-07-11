# Maintainer: Luka Dornhecker <luka.dornhecker@gmail.com>
pkgname=chanloader
pkgver=0.0.1
pkgrel=2
pkgdesc="4chan command-line image downloader"
arch=("any")
url="https://github.com/lukad/chanloader"
license=('GPL')
makedepends=("wget")
provides=("chanloader")

package() {
	wget "https://github.com/lukad/$pkgname/releases/download/v$pkgver/$pkgname-linux-$CARCH"
	install -D -m755 ${pkgname}-linux-${CARCH} ${pkgdir}/usr/bin/${pkgname} || return 1
}
