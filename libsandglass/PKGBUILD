# Maintainer: Tavian Barnes <tavianator@gmail.com>

pkgname=libsandglass
pkgver=0.3
pkgrel=1
pkgdesc="A benchmarking library with clock-cycle resolution."
arch=('i686' 'x86_64')
url="http://libsandglass.googlecode.com/"
license=('LGPL3')
groups=()
depends=('glibc')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!libtool')
install=
source=("http://libsandglass.googlecode.com/files/libsandglass-$pkgver.tar.xz")
noextract=()
md5sums=('4a4a9a7d3a4decfe378496440badc344')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install || return 1
}
