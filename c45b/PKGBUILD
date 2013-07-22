# Maintainer: Artem Grunichev <gluk[at]umbrosia[dot]ru>
pkgname=c45b
pkgver=0.0.1
pkgrel=1
pkgdesc="c45b is a frontend to the AVR bootloader from Chip45 GmBH."
url="https://github.com/bullestock/c45b"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=()
optdepends=()
makedepends=('qt4' 'gcc')
conflicts=()
replaces=()
backup=()
install='c45b.install'
source=("https://github.com/bullestock/c45b/archive/master.zip")
md5sums=('9c05b92f36e70a36cd5c9ba53b3ee841')

build() {
  mv "${pkgname}-master" "${pkgname}-${pkgver}" 
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake-qt4 PREFIX=${pkgdir}
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 console/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et: 
