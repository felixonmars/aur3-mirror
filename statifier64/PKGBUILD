# Contributor: Tim Yang <tdy@gmx.com>
# Contributor: Jens Pranaitis <jens@jenux.homelinux.org>
# Contributor: Leslie P. Polzer <polzer@gnu.org>
pkgname=statifier64
pkgver=1.6.15
pkgrel=2
pkgdesc="A tool for generating static binaries of dynamic ELF executables"
arch=('i686', 'x86_64')
url="http://statifier.sourceforge.net/"
license=('GPL')
depends=('gdb')
source=(http://downloads.sourceforge.net/statifier/statifier-$pkgver.tar.gz)
md5sums=('624bf5d2096ef495bd9d8f5b8963b23b')

build() {
  cd "$srcdir/statifier-$pkgver"
  mv configs/config.x86_64 configs/config.x86_64.orig
  if ! [ -f "/usr/include/gnu/stubs-32.h" ]; then
    cat configs/config.x86_64.orig | perl -ne 's/^(\s*ELF32\s*\:\=\s*)(yes)/$1no/i; print' > configs/config.x86_64
  fi
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
