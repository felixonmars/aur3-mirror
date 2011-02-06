# Maintainer: Kevin Whitaker <eyecreate at gmail dot com>

pkgname=nhocr
pkgver=0.19
pkgrel=1
pkgdesc="NHocr is a command line OCR (Optical Character Recognition) program for Japanese language, etc."
arch=('i686' 'x86_64')
url="http://code.google.com/p/nhocr/"
license=('Apache')
depends=('freetype2' 'o2-tools')
source=(http://nhocr.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('cf938f677dd443e75513d5c8554e27d9')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
 
