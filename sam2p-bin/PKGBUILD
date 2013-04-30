# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sam2p-bin
pkgver=0.49
pkgrel=1
pkgdesc="A bitmap-to-eps-or-pdf-converter that produces very small files"
arch=('i686' 'x86_64')
url="http://www.inf.bme.hu/~pts"
license=('GPL2')
depends=('gcc-libs')
makedepends=('makedepend')
optdepends=('ghostscript: PS, EPS, PDF support'
'libjpeg: JPEG support'
'tif22pnm: for tiff and png support')
source=("sam2p-0.49-linux-static.tar.gz::http://code.google.com/p/sam2p/downloads/detail?name=sam2p-0.49-linux-static.tar.gz")
md5sums=('e44f72d10b5e1ea2d884495f181d05b6')

package() {
  cd "$srcdir/sam2p-0.49-linux-static"
  install -D -m755 sam2p "$pkgdir"/usr/bin/sam2p
  install -D -m644 README "$pkgdir"/usr/share/sam2p/docs/README
}
