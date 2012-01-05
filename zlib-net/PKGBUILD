# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=zlib-net
pkgver=1.0.4
pkgrel=1
pkgdesc="Managed version of ZLIB compression library"
arch=('any')
url="http://www.componentace.com/zlib_.NET.htm"
license=('BSD')
depends=('mono')
makedepends=('unzip')
source=("http://www.componentace.com/data/distr/zlib.NET_${pkgver//./}.zip")
md5sums=('b58fb31ec7552e1a13f76c5356a23468')

build() {
  cd "$srcdir"
  install -D -m644 bin/zlib.net.dll "$pkgdir"/usr/lib/mono/4.0/zlib.net.dll
  install -D -m644 license.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

