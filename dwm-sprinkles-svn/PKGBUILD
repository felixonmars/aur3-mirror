# Contributor: Patrice Peterson <runiq at archlinux dot us>

pkgname="dwm-sprinkles-svn"
pkgver="r143"
pkgrel=1
pkgdesc="Dwm with sprinkles patches (SVN version)"
arch=("i686" "x86_64")
url="http://0mark.unserver.de/projects/dwm-sprinkles"
license=("GPL")
depends=("libxinerama")
makedepends=("svn")
provides=("dwm")
conflicts=("dwm" "dwm-sprinkles" "dwm-sprinkles-experimental")
source=("$pkgname-$pkgver::svn+https://svn.0mark.unserver.de/dwm/trunk/dwm-sprinkles")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname-$pkgver"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$pkgname-$pkgver"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package () {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install

  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README"
}
