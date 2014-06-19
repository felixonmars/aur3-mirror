# Contributor: Patrice Peterson <runiq at archlinux dot us>

pkgname="dwm-sprinkles"
_pkgname="dwm"
pkgver=5.8.2
_pkgver=${pkgver}.s
pkgrel=6
pkgdesc="Dwm with sprinkles patches"
arch=("i686" "x86_64")
url="http://0mark.unserver.de/projects/dwm-sprinkles"
license=("GPL")
depends=("libxinerama")
provides=("dwm")
conflicts=("dwm" "dwm-sprinkles-svn" "dwm-sprinkles-experimental")
source=("http://0mark.unserver.de/data/files/${_pkgname}-${pkgver}.s.tar.gz")

build() {
  cd "${_pkgname}-${_pkgver}"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package () {
  cd "${_pkgname}-${_pkgver}"
  make PREFIX=/usr DESTDIR=$pkgdir install

  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README"
}

sha256sums=('1970f8b6d897f91fecdde715fd15ad745ebe2f704a518ce18610a34024963a29')
