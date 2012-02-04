# Contributor: Blake Imsland <uzum4ki@gmail.com>

pkgname=imediff2
pkgver=1.1.2
pkgrel=1
pkgdesc="interactive 2-way merge tool"
arch=(any)
url="http://elonen.iki.fi/code/imediff/"
license=('GPL')
depends=('ncurses' 'python2')
source=(http://alioth.debian.org/frs/download.php/1439/$pkgname-$pkgver.tar.gz)
md5sums=('e630e96229a7d0364f73ff595794c07c')

build() {
  cd $srcdir/$pkgname

  sed -i imediff2 \
    -e 's|^#!/usr/bin/python.*|#!/usr/bin/python2|' \
    -e "s|^VERSION = .*|VERSION = '$pkgver'|"
}

package() {
  cd $srcdir/$pkgname

  install -D -m 0755 imediff2 $pkgdir/usr/bin/imediff2
  install -D -m 0644 imediff2.1 $pkgdir/usr/man/man1/imediff2.1
}
