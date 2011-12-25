pkgname=musicd
pkgver=0.2.0
pkgrel=0
pkgdesc="A music indexing and streaming server."
arch=('i686' 'x86_64')
url="http://tsundere.fi/musicd/"
license=('GPL')
makedepends=()
depends=('ffmpeg' 'sqlite3' 'freeimage')
source=("https://github.com/Kray/musicd/tarball/v$pkgver")
md5sums=('1f9a5c1b1ddbc1a144c8128355a22164')

build() {
	cd $srcdir/Kray-musicd-* #This is... ugly
	make PREFIX=${pkgdir}/usr install
}
