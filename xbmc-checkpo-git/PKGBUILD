# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=xbmc-checkpo-git
pkgver=r6.7319104
pkgrel=1
pkgdesc="check, clean format string po files for xbmc"
arch=(i686 x86_64)
url="https://github.com/alanwww1/xbmc-checkpo"
license=('GPL')
source=('xbmc-checkpo::git+https://github.com/alanwww1/xbmc-checkpo.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/xbmc-checkpo
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/xbmc-checkpo
  make
}

package() {
  cd "$srcdir"/xbmc-checkpo
  install -d "$pkgdir/usr/bin"
  install -m755 xbmc-checkpo "$pkgdir/usr/bin"
}


# vim:set ts=2 sw=2 et:
