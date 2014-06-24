# Maintainer: Gagou <gagou@rez-gif.supelec.fr>
pkgname=liblcfg
pkgver=20140623
pkgrel=1
pkgdesc="A lightweight configuration file library written in C99"
url="http://liblcfg.carnivore.it/"
license=(GPL)
arch=('i686' 'x86_64' 'armv6h')
depends=(glibc)
makedepends=(git)
source=("liblcfg::git://git.carnivore.it/liblcfg.git")
md5sums=('SKIP')

_gitname="liblcfg"

build() {
  cd "$srcdir/$_gitname/code"

  sed -i s/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g ./configure.ac 
  autoreconf -i
  ./configure --prefix=/usr || return 1
  make || return 1
}
package() {
  cd "$srcdir/$_gitname/code"
  make DESTDIR=$pkgdir install
}
