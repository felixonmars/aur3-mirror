# Maintainer: Tinu Weber <takeya at bluewin dot ch>

pkgname=karuibar
pkgver=0.1
pkgrel=2
pkgdesc="Modular, hackable status bar for X"
arch=('any')
url='https://github.com/ayekat/karuibar'
license=('GPL')
groups=('karui')
depends=('libx11')
optdepends=('libmpdclient: mpd module'
            'alsa-lib: audio module')

source=('https://github.com/ayekat/karuibar/archive/0.1.tar.gz')
md5sums=('6225d3212952b3af081396525281ad33')

build() {
	cd "$pkgname-$pkgver"
	make enableall
	make INSTALLDIR=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALLDIR="$pkgdir/usr" install
}
