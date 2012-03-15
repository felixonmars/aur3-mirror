pkgname=pakchois
pkgver=0.4
pkgrel=1
pkgdesc="A wrapper library for PKCS#11"
arch=('i686' 'x86_64')
url="http://www.manyfish.co.uk/pakchois/"
license=('LGPLv2+')
depends=('glibc')
makedepends=('gettext')
options=('!libtool')
source=("http://www.manyfish.co.uk/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
md5sums=('218ad0256e514989299acdf4e86aaf3d'
          '66c2d3dcf5b71ab89b16d4942098d806')
sha256sums=('d73dc5f235fe98e4d1e8c904f40df1cf8af93204769b97dbb7ef7a4b5b958b9a'
            'e5e46e0f1e251397e6307ff65927f454857786734cfa89f3b65247e7d7a3bdd4')


build() {

  cd "$srcdir/$pkgname-$pkgver"

  LDFLAGS+=" -Wl,--no-undefined"

  __pkcs11p='/usr/lib/pkcs11:/usr/lib/gnome-keyring:/usr/lib'

  ./configure --prefix=/usr \
    --disable-static \
    --enable-shared \
    --with-pic # --enable-module-path="$__pkcs11p"

  make V=1

}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
