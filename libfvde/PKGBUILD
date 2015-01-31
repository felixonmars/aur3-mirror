# Maintainer: Natalia Portillo <claunia@claunia.com>
# Category: system

pkgname=libfvde
pkgver=20130305.r2.g8ba4a37
pkgrel=1
pkgdesc="Library and tools to access FileVault Drive Encryption (FVDE) encrypted volumes"
url="https://github.com/libyal/libfvde"
arch=('x86_64' 'i686')
license=('LGPL3')
depends=('openssl' 'fuse' 'libxml2')
source=(libfvde::git+https://github.com/libyal/libfvde)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $startdir/src/$pkgname
  ./synclibs.sh
  ./autogen.sh
}

build() {
  cd $startdir/src/$pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $startdir/src/$pkgname
  make DESTDIR=${pkgdir} install
}
