# Author: mr1337357 <mr1337357@gmail.com>
# Author: ryanjacobs <ryan.mjacobs@gmail.com>
pkgname=naken_asm
pkgver=2014.10.27
pkgrel=2
pkgdesc="A raw, simple assembler supporting 65xx, ARM, dsPIC, MIPS, 8051/8052, and MSP430 instruction sets"
arch=('i686' 'x86_64' 'arm')
url="http://www.mikekohn.net/micro/naken_asm.php"
license=('GPL')
depends=('readline')
source=('http://downloads.mikekohn.net/naken_asm/naken_asm-2014-10-27.tar.gz')
md5sums=('adedb16f5186ef2cfc966476ef376d50')

build() {
  cd $srcdir/$pkgname-${pkgver//./-}
  ./configure --install-prefix='${DESTDIR}/usr'
  make
}

package() {
  cd $srcdir/$pkgname-${pkgver//./-}
  make DESTDIR="$pkgdir" install
}
