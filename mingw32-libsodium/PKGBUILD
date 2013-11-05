# Maintainer: naxuroqa <naxuroqa@gmail.com>
pkgname=mingw32-libsodium
pkgver=0.4.5
pkgrel=1
pkgdesc="P(ortable|ackageable) NaCl, the Networking and Cryptography library (mingw32)"
arch=('any')
url="https://github.com/jedisct1/libsodium"
license=('custom')
makedepends=('mingw32-gcc' 'autoconf')
depends=('mingw32-runtime')
options=('!strip' '!buildflags' '!libtool')
source=("https://download.libsodium.org/libsodium/releases/libsodium-$pkgver.tar.gz")
md5sums=('3a97d2c29ec0133e334036e3f19d0741')

build() {
  cd "$srcdir/libsodium-$pkgver"
  unset LDFLAGS

  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32
  make
}

package() {
  cd "$srcdir/libsodium-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
