# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Byron Clark <byron@theclarkfamily.name>
# based on thrift-git PKGBUILD
pkgname=vim-thrift
pkgver=0.9.0
pkgrel=1
pkgdesc="VIm syntax files for highlighting Thrift"
arch=(i686 x86_64)
url="http://thrift.apache.org/"
license=(APACHE)
depends=(vim-runtime)
options=(!emptydirs !makeflags)
source=(http://www.apache.org/dist/thrift/$pkgver/thrift-$pkgver.tar.gz)
md5sums=('beb2c8290e97c93e3b2844f558cc5c7d')

package() {
  install -d -m 0755 $pkgdir/usr/share/vim/vimfiles/syntax
  install -m 0644 $srcdir/thrift-$pkgver/contrib/thrift.vim $pkgdir/usr/share/vim/vimfiles/syntax
}
# vim:set ts=2 sw=2 et:
