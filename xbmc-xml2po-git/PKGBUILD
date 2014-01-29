# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=xbmc-xml2po-git
pkgver=r52.036861d
pkgrel=1
pkgdesc="A converter utility in C++for converting xbmc language xmls to po and potfiles."
arch=(i686 x86_64)
url="https://github.com/alanwww1/xbmc-xml2po"
license=('GPL')
source=('xbmc-xml2po::git+https://github.com/alanwww1/xbmc-xml2po.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/xbmc-xml2po
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/xbmc-xml2po
  make
}

package() {
  cd "$srcdir"/xbmc-xml2po
  install -d "$pkgdir/usr/bin"
  install -m755 xbmc-xml2po "$pkgdir/usr/bin"
}


# vim:set ts=2 sw=2 et:
