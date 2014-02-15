# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=picloud
pkgver=2.8.5
pkgrel=1
pkgdesc="Client-side module to connect to the PiCloud servers"
arch=(any)
url="http://www.picloud.com/"
license=('LGPL')
depends=('python2')
makedepends=('python2-distribute')
install="picloud.install"
options=(!emptydirs)
source=(http://s3.amazonaws.com/cloud_download/cloud-$pkgver.tar.gz)
md5sums=('22fb18f782ca611de2b5ab60bb11febe')

build() {
  cd "$srcdir"/cloud-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/cloud-$pkgver
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${pkgdir}" -name '*.py')
}

