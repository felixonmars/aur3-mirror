# Contributor: rabyte <rabyte__gmail>

pkgname=quetoo
pkgver=0.6.1
pkgrel=4
pkgdesc="A Quake 2-compatible game engine optimized for simplicity, security, stability and speed"
arch=('i686')
url="http://jdolan.dyndns.org/trac/wiki/Quetoo"
license=('GPL2')
depends=('sdl' 'zlib')
makedepends=('autoconf' 'automake')
options=(!libtool)
install=$pkgname.install
source=(http://tastyspleen.net/~jdolan/$pkgname-$pkgver.tar.bz2)
md5sums=('8b0e885dc9abf0c2af53d396d5e221bf')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr --with-games="baseq2  ctf  qmass  vanctf" --disable-warn
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  mkdir -p $pkgdir/usr/share/quake2
}
