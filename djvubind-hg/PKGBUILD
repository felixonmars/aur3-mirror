pkgname=djvubind-hg
pkgver=1.2.0
pkgrel=2
pkgdesc="A tool to create highly compressed djvu files with ocr, metadata, and bookmarks"
arch=("i686" "x86_64")
url="http://code.google.com/p/djvubind/"
license=("GPL3")
depends=("python" "djvulibre" "imagemagick" "tesseract")
makedepends=("python" "mercurial")
provides=("djvubind")
conflicts=("djvubind")
optdepends=("minidjvu: for higher black-and-white compression"
            "cuneiform: an alternative OCR system")

_hgroot="https://code.google.com/p/djvubind/"

package() {
  echo
}

build() {
  cd "$startdir/src"
  hg clone "$_hgroot" $pkgname
  cd $pkgname
  python ./setup.py install --root "$pkgdir"
}
