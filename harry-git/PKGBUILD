# Maintainer: Andreas Wagner (pointfree) <andreas.wagner@lowfatcomputing.org>

_pkgname=harry
pkgname=${_pkgname}-git
pkgver=r225.3a6b87a
pkgrel=1
pkgdesc="A tool for measuring string similarity."
arch=('i686' 'x86_64')
url="http://mlsec.org/harry"
license=('GPL3')
depends=('zlib' 'libconfig' 'libarchive')
makedepends=('git' 'automake' 'autoconf' 'libtool')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$pkgname"::git+https://github.com/rieck/${_pkgname}.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  . /etc/profile.d/perlbin.sh
  ./bootstrap
  ./configure --prefix=/usr --enable-libarchive --enable-pthread --enable-md5hash
  make
}

check() {
  cd "$srcdir/$pkgname"
  make check
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}

