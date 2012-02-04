# Contributor: gucong <gucong43216@gmail.com>

pkgname=djvuocr
pkgver=0.1
pkgrel=1
pkgdesc="Do optical character recognition(OCR) with djvu files"
arch=('any')
license=('CCPL:by-sa')
url="http://en.wikisource.org/wiki/User:Inductiveload/Scripts/DJVU_OCR"
depends=('python2' 'tesseract' 'imagemagick' 'djvulibre')
source=('djvuocr')
md5sums=('9817bb7cf467f49ba42526a102dfa69c')
noextract=('djvuocr')

package() {
  install -D -m 755 "$srcdir/djvuocr" "$pkgdir/usr/bin/djvuocr"
}
