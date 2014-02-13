# Maintainer: 404
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=sge
pkgver=030809
pkgrel=2
pkgdesc="SDL Graphics Extension"
arch=('i686' 'x86_64')
url="http://www.digitalfanatics.org/cal/sge/index.html"
license=("LGPL")
depends=('sdl_image' 'freetype2')
source=("http://www.digitalfanatics.org/cal/sge/files/sge$pkgver.tar.gz"
        "sge-$pkgver-cmap.patch"
        "sge-$pkgver-build.patch"
        "sge-$pkgver-freetype.patch")
sha256sums=('25cfbe59ab99647254e69d25984707045492c2a5d1b15f27d999d0284a7110fc'
            '264bf8966bdb13a47491af1e4417e31a7f8e94ece40c30a1f2d94b95d9e120f5'
            '53f8e2ab8080f14edfed161055f01ccc94a1d44c7e478ce40fc0dcbd794d4f94'
            'a537b98f3282881393ce6270a91564b4554eaec0ef9eacd51ea4b07048f80d79')
options=('staticlibs')

prepare() {
  cd sge$pkgver

  patch -Np1 < ../sge-$pkgver-cmap.patch
  patch -Np0 < ../sge-$pkgver-build.patch
  patch -Np0 < ../sge-$pkgver-freetype.patch
}  

build() {
  cd sge$pkgver

  make
}

package() {
  cd sge$pkgver

  make DESTDIR="$pkgdir" install
}
