# Maintainer: Josef Patoprsty <seppi@josefnpat.com>

pkgname=texpack-git
pkgver=r38.4b1c487
pkgrel=1
pkgdesc="Simple cross-platform command line texture packer based on the MaxRects algorithm by Jukka Jylänki."
arch=(i686 x86_64)
url="https://github.com/urraka/texpack"
license=('MIT')
depends=('libpng')
source=('git+http://github.com/urraka/texpack')
makedepends=('git')
options=(!strip)
md5sums=('SKIP')

pgkver() {
  cd $srcdir/texpack
  git rev-parse --short HEAD | sed 's|-||g'
}

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/texpack"
  make
}

package() {
  cd "$srcdir/texpack"
  mkdir -p "$pkgdir/usr/local/bin"
  make PREFIX="$pkgdir/usr/local/" install
}

# vim:set ts=2 sw=2 et:
