# Maintainer: Erik Sundqvist <erik [dot] sundqvist97 [at] gmail [dot] com>
pkgname=mfterm
pkgver=1.0.3
pkgrel=1
pkgdesc="Terminal for working with Mifare Classic 1-4k tags"
url="https://github.com/4ZM/mfterm"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libnfc' 'readline' 'bison' 'openssl' 'flex')
optdepends=()
makedepends=('automake')
conflicts=()
replaces=()
backup=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/4ZM/mfterm/archive/v1.0.3.tar.gz")
md5sums=('0d410d5f3d8613d1068ef8494ba2bf86')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
