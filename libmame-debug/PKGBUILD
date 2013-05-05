# Contributor: Bryan Ischo <bryan@ischo.com>
pkgname=libmame-debug
pkgver_major=0.146
pkgver_minor=5
pkgver=$pkgver_major.$pkgver_minor
pkgrel=1
pkgdesc="MAME as a library (debug version)"
arch=('i686' 'x86_64')
url="https://github.com/bji/libmame"
license=('MAME')
groups=()
depends=(libmame)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(https://github.com/bji/libmame/archive/v$pkgver.tar.gz)
noextract=()
md5sums=('318bc5f1cddcf6ccd9f6d8f1b31cb313')

build() {
  cd $srcdir/libmame-*

  make NOWERROR=1 BUILD_LIBMAME=1 DEBUG=1 libmame || return 1
  make NOWERROR=1 BUILD_LIBMAME=1 STATIC=1 DEBUG=1 libmame || return 1
}

package() {
  cd $srcdir/libmame-*

  mkdir -p $pkgdir/usr/lib/libmame-debug
  mkdir -p $pkgdir/usr/share/licenses/libmame-debug
  cp obj/posix*/libmame.so $pkgdir/usr/lib/libmame-debug/libmame.so.0.0.146
  ln -s libmame.so.0.0.146 $pkgdir/usr/lib/libmame-debug/libmame.so.0
  ln -s libmame.so.0 $pkgdir/usr/lib/libmame-debug/libmame.so
  cp obj/posix*/libmame.a $pkgdir/usr/lib/libmame-debug
  cp docs/license.txt $pkgdir/usr/share/licenses/libmame-debug
}
