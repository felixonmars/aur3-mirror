# Contributor: André Prata <andreprata at bugflux dot org>

pkgname=libspopc
pkgver=0.12
pkgrel=1
pkgdesc="A simple pop3 mail client library"
arch=('i686' 'x86_64')
url="http://herewe.servebeer.com/libspopc/"
license=('LGPL')
depends=('openssl' 'libgcrypt')
makedepends=('gcc' 'glibc' 'make')
provides=('libspopc')
source=(http://herewe.servebeer.com/libspopc/releases/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('82a9fad896450fa4a95831f614cbd959')

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/lib || return 1
  mkdir -p $pkgdir/usr/include || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
