# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Christoph Zeiler <rabyteNOSPAM_at_gmx.dot.org>

pkgname=msx
pkgver=1.8
pkgrel=1
pkgdesc="An MSX emulator"
arch=('i686' 'x86_64')
url="http://www.vanheusden.com/msx-emul/"
license=('GPL')
depends=('ncurses' 'sdl' 'libsndfile' 'z80ex')
source=($url/$pkgname-$pkgver.tgz)
md5sums=('bfae49559f1813d5b5a41f6b28bf9588')

build() {
  cd $pkgname-$pkgver

  sed 's|-O2||g' -i Makefile
  make DEBUG= 
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 msx "$pkgdir"/usr/bin/msx
}
