# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=luasec-prosody
pkgname=lua51-sec-prosody
pkgver=0.5
pkgrel=1
pkgdesc='Lua bindings for OpenSSL library to provide TLS/SSL communication.'
arch=('i686' 'x86_64')
url="http://github.com/mwild1/luasec"
license=('MIT')
depends=('openssl' 'lua51' 'lua51-socket-prosody')
conflicts=('lua51-sec')
provides=('lua51-sec=2.1.0')

source=("http://prosody.im/files/$_realname-$pkgver.tar.gz"
        'luasec.patch')
md5sums=('cb11da1b60f249296ab40f987d2db379'
         '8784e7acdf82d30e750a97e3a2289281')

prepare() {
  cd "$srcdir/$_realname-$pkgver"

  patch -p1 Makefile "$srcdir/luasec.patch"
}

build() {
  cd "$srcdir/$_realname-$pkgver"

  make INCDIR='-I. -I/usr/include/lua5.1' prefix=/usr linux
}

package() {
  cd "$srcdir/$_realname-$pkgver"

  mkdir -p "$pkgdir/usr/share/lua/5.1"
  mkdir -p "$pkgdir/usr/share/lua/5.1/ssl"
  mkdir -p "$pkgdir/usr/lib/lua/5.1"
  make prefix=/usr DESTDIR="$pkgdir/" install
  chmod +x "$pkgdir/usr/lib/lua/5.1/ssl.so"

  install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
