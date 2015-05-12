# Maintainer: Alexey Michurin <a.michurin@gmail.com>
pkgname='ispell-ru-koi8-r-io'
pkgver='0.99g5'
pkgrel='3'
arch=('any')
license=('custom:BSD')
pkgdesc='Russian dictionary for ispell. KOI8-R, Cyrillic_io supported.'
url='ftp://scon155.phys.msu.su/pub/russian/ispell/README'
depends=('ispell')
makedepends=('ispell')
options=('!strip' '!docs' '!libtool' '!emptydirs' '!zipman' '!purge')
source=(
  'ftp://scon155.phys.msu.su/pub/russian/ispell/rus-ispell-0.99g5.tar.gz'
)
md5sums=(
  '1fc423903273dd30a1fe0b834b17a8dc'
)

prepare() {
  # set LC_ALL=C to get the sort order that uses native byte values
  sed -i '16 s-sort-LC_ALL=C sort-' "$srcdir/sortkoi8"
}

build() {
  cd "${srcdir}"
  make koi YO=1 || return 1
}

package() {
  mkdir -p "${pkgdir}/usr/lib/ispell"
  make LIB="${pkgdir}/usr/lib/ispell" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
