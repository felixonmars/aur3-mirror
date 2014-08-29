# Maintainer: chronular <chronular at gmail>
pkgname=mathopd
pkgver=1.5p8
pkgrel=1
pkgdesc="A fast, lightweight, non-forking HTTP server"
arch=('any')
url="http://www.mathopd.org/"
license=('BSD')
source=("http://www.mathopd.org/dist/$pkgname-$pkgver.tar.gz")
sha256sums=('02a372051bd8f4f2b2af4226d5a6f71ff39850361ba25e65cbc17e9e471497ff')

build() {
  cd "$pkgname-$pkgver/src"
  sed -i 's,# CPPFLAGS = -DHAVE_CRYPT_H,CPPFLAGS = -DHAVE_CRYPT_H,' Makefile
  sed -i 's,# CPPFLAGS += -DLINUX_SENDFILE,CPPFLAGS += -DLINUX_SENDFILE,' Makefile
  sed -i 's,# EXTRA_OBJS += sendfile.o,EXTRA_OBJS += sendfile.o,' Makefile
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -D "src/mathopd" "$pkgdir/usr/sbin/mathopd"
  install -D "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
