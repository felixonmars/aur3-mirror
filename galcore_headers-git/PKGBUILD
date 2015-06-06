# Vivante GAL core headers.
# Maintainer: Brandon Edens <brandonedens@gmail.com>

pkgname=galcore_headers
pkgbase=$pkgname-git
pkgver=1.0
pkgrel=1
pkgdesc='Headers for the galcore kernel module.'
arch=('armv7h')
url="https://github.com/etnaviv/galcore_headers/"
license=('GPL2')
srcname=galcore_headers
makedepends=('git sed')
provides=("$pkgname")
conflicts=("$pkgname")
source=('git+https://github.com/etnaviv/galcore_headers.git')
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname/include_imx6_v4_6_9"
  mkdir -p $pkgdir/usr/include/
  install -Dm644 * $pkgdir/usr/include/
}

# vim:set ts=2 sw=2 et:
