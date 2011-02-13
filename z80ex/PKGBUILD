# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=z80ex
pkgver=1.1.19
pkgrel=1
pkgdesc="The portable ZiLOG Z80 CPU emulator designed as a library"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/z80ex/"
license=('GPL')
depends=('glibc')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('8bbc086ed7dbe4590adc89115ae59b95')

build() {
  cd $pkgname-$pkgver

  sed	-e 's|-O2||g' \
	-e '/ldconfig/d' \
	-i Makefile

  make
}

package() {
  cd $pkgname-$pkgver

  make INSTALL_PREFIX="$pkgdir"/usr install
  find "$pkgdir" -type f -exec chmod 644 {} \;
}

