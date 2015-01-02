# Maintainer: wrbs <logiblocs at gmail dot com>
# Contributor: bbq
pkgname=wbfs_file
pkgver=2.9
pkgrel=2
pkgdesc="A tool to convert standard Wii game ISO images to WBFS files, and vice versa"
arch=('i686' 'x86_64')
url="http://code.google.com/p/cfg-loader/"
license=('GPL2')
depends=('openssl')
source=(http://cfg-loader.googlecode.com/files/${pkgname}_$pkgver.zip)
md5sums=('c07364893bf426bd31db7644fe9ed372')

prepare() {
  # Use dynamic linking instead of static linking
  sed -i 's/ADD_LF = -static/#&/' "$srcdir/${pkgname}_$pkgver/source/Makefile" 
}

build() {
  cd "$srcdir/${pkgname}_$pkgver/source"
  make
}

package() {
  install -D -m 0755 "$srcdir/${pkgname}_$pkgver/source/wbfs_file" "$pkgdir/usr/bin/wbfs_file"
}
