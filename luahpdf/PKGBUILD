# Maintainer : perlawk

pkgname=luahpdf
pkgver=1.5
pkgrel=1
pkgdesc="LuaHPDF is a module that lets you programmatically create PDF files using Lua. It does this by binding to the Haru Free PDF Library."
url="http://luahpdf.colloquiki.com/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('lua' 'libharu')
source=("https://luahpdf.googlecode.com/files/luahpdf-1.5.tar.gz")

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's!PREFIX=/usr/local!PREFIX=/usr!' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
md5sums=('7e16e4d6d962318aa39844de070dbead')
