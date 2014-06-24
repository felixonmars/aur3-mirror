# Maintainer: Gagou <gagou@rez-gif.supelec.fr>
pkgname=libemu
pkgver=20140623
pkgrel=1
pkgdesc="A small library written in c offering basic x86 emulation and shellcode detection"
url="http://libemu.carnivore.it/"
license=(GPL)
arch=('i686' 'x86_64' 'armv6h')
depends=('glibc')
makedepends=('git')
source=("libemu::git://git.carnivore.it/libemu.git")
md5sums=('SKIP')

_gitname="libemu"

build() {
  cd "$srcdir/$_gitname"

  sed -i s/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g ./configure.ac
  autoreconf -i || return 1
  CFLAGS="${CFLAGS} -Wno-unused-local-typedefs" ./configure --prefix=/usr || return 1
  make || return 1
}
package() {
  cd "$srcdir/$_gitname"
  make DESTDIR=$pkgdir install
}

