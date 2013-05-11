# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Anders Bergh <anders1@gmail.com>

_realname=luasocket-prosody
pkgname=lua51-socket-prosody
pkgver=2.1.0
pkgrel=1
pkgdesc="Luasocket is the most comprehensive networking support library for the Lua language."
arch=('i686' 'x86_64')
url="http://github.com/mwild1/luasocket"
license=('MIT')
depends=('lua51')
conflicts=('lua51-socket')
provides=('lua51-socket=2.1.0')

source=("http://prosody.im/files/$_realname-$pkgver.tar.gz")
md5sums=('29a04c0344ff6cec3adb9bf2122b5673')

build() {
  cd "$srcdir/$_realname-$pkgver"

  make prefix=/usr linux
}

package() {
  cd "$srcdir/$_realname-$pkgver"

  make prefix=/usr DESTDIR="$pkgdir/" install-unix
  install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
