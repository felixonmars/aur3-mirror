# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
pkgname=emerald-theme-starace
pkgver=0.9
pkgrel=1
pkgdesc="Emerald theme inspired by the movie Tron Legacy."
arch=(any)
url="http://chriseiffel.com/everything-linux/starace-emerald-theme/"
license=(custom) # CC-by-sa
depends=('emerald')
changelog=ChangeLog
source=('http://chriseiffel.com/starace/Starace.emerald')
noextract=('Starace.emerald')
md5sums=('eb23f48bf0c4b5cfcd93956189b09972')
sha1sums=('6378907228c0707c60f982be35adfdb54b806d5d')

build() {
  cd "$srcdir"
  mkdir Starace
  bsdtar -x -f Starace.emerald -C Starace
}

package() {
  cd "$srcdir/Starace"
  install -d $pkgdir/usr/share/emerald/themes/Starace
  install -m644 -t $pkgdir/usr/share/emerald/themes/Starace *
}

# vim:set ts=2 sw=2 et:
