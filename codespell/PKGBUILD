# Maintainer: Anatol Pomozov <anatol@google.com>
# Contributor: Lucas De Marchi <lucas.de.marchi@gmail.com>

pkgname=codespell
pkgver=1.6
pkgrel=1
pkgdesc='Fix common misspellings in source code'
url='https://github.com/lucasdemarchi/codespell'
license=(GPL)
arch=(any)
depends=(python)
source=(https://github.com/lucasdemarchi/codespell/archive/v$pkgver.tar.gz)
sha1sums=('1cf696b870d07fcdd878455ccebb6afa75d47025')

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir"
}
