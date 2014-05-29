# Maintainer: Quinn Evans <yoshizuki-at-gmail-dot-com>
pkgname=gnu-lightning-git
pkgver=2.0.4
pkgrel=2
pkgdesc="A library that generates assembly language code at run-time"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/lightning/"
license=('GPL')
depends=('zlib') # This is unnecessary if --enable-disassembler s/enable/disable/
makedepends=('git')
provides=('gnu-lightning')
conflicts=('gnu-lightning')
options=('!libtool')
source=('git://git.sv.gnu.org/lightning.git')
md5sums=('SKIP')

_gitname=lightning

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed -e 's|-|.|g' -e 's|lightning.||'
}

build() {
  cd $_gitname
  autoreconf -i
  LDFLAGS="-lz" ./configure --prefix=/usr $(if [ $CARCH = 'x86_64' ]; then echo "--disable-disassembler"; fi)
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
