# Maintainer: Anton Shestakov <engored*ya.ru>
pkgname=upset
pkgver=04
pkgrel=1
pkgdesc='A tool to create and apply UPS patches'
arch=(i686 x86_64)
url='http://byuu.org/programming/'
license=('unknown')
depends=(gtk2)
makedepends=(pkg-config)
source=("http://byuu.org/files/upset_v${pkgver}.tar.bz2")
md5sums=('20a05d2b6855b36ce973bf2bfb30a8b0')

build() {
  cd "$srcdir/$pkgname"
  
  sed -i -e 's#g++-4.5#g++#g' ./cc-gtk.sh
  /bin/sh ./cc-gtk.sh
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m755 ./upset "$pkgdir/usr/bin/upset"
}
