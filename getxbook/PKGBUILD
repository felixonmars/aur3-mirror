# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=getxbook
pkgver=1.1
pkgrel=2
pkgdesc="Programs to download books from several websites(Google, Amazon, Barnes & Noble)"
arch=('i686' 'x86_64')
url="https://njw.name/getxbook/"
license=('ISC')
optdepends=('tk: for getxbookgui'
            'imagemagick: Image manipulation'
            'djvulibre: Convert books to djvu'
            'tesseract: Reading OCR codes'
            'pdftk: PDF manipulation'
            'exactimage-svn: Creation of searchable PDF files from hOCR input')
source=(https://njw.name/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('01a01e56fbac7110f63594af87a8b78f')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  # Fix path (/usr/local -> /usr)
  sed -i 's_/usr/local_/usr_' config.mk
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install

  # License
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # Book conversion scripts
  cd extras
  install -Dm755 * $pkgdir/usr/bin
}