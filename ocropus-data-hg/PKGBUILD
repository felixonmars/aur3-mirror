pkgname=ocropus-data-hg
pkgver=46
pkgrel=1
pkgdesc="An OCR system for documents and books (data only)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ocropus/"
license=('custom') # The uw3 dataset is not redistributable, which makes the models closed-source
makedepends=('curl' 'bzip2')
source=(ocroinst.patch)
options=()
md5sums=('39c5a8590565f8f5463791a64641ac64')

build() {
    cd "$srcdir"
    curl http://ocropus.googlecode.com/hg/ocroinst >ocroinst
    patch -N -p1 -i "$srcdir/ocroinst.patch"
    chmod +x ocroinst
    PKGDIR="$pkgdir" ./ocroinst dl || exit
}
