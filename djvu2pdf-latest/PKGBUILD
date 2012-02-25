# Maintainer:  Nikita Nikishin <i.nnikishi@gmail.com>

pkgname=djvu2pdf-latest
pkgver=0.9.2
pkgrel=1
pkgdesc="A small script to convert DjVu files to PDF files"
arch=('i686' 'x86_64')
url="http://0x2a.at/s/projects/djvu2pdf"
license=('GPL')
depends=('ghostscript' 'netpbm' 'djvulibre')
source=(http://0x2a.at/site/projects/djvu2pdf/djvu2pdf-$pkgver.tar.gz)
md5sums=('af93c29a857a014f86dffcff6c773ef1')

build() {
  cd "$srcdir/djvu2pdf-$pkgver"
  install -Dm755 djvu2pdf "$pkgdir/usr/bin/djvu2pdf"
  install -Dm644 djvu2pdf.1.gz "$pkgdir/usr/share/man/man1/djvu2pdf.1.gz"
}
