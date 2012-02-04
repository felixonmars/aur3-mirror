# Maintainer:  Harry Urcen <harry.ucen@gmail.com>

pkgname=naken430asm
pkgver=2011.10.30
pkgrel=2
pkgdesc="An open-sourced assembler / disassembler / simulator for the MSP430 series of microcontrollers"
arch=('i686' 'x86_64')
url="http://www.mikekohn.net/micro/naken430asm_msp430_assembler.php"
license=('GPL')
depends=('readline')
#conflicts=('mspdebug-git')
source=(http://downloads.mikekohn.net/naken430asm/naken430asm-2011-10-30.tar.gz)
#install=naken430asm.install
md5sums=('d4878814d856fcfae898f55d1277100f')

build() {
  cd $srcdir/$pkgname-${pkgver//./-}
	#make clean
  ./configure --install-prefix='${DESTDIR}/usr'
	make
}

package() {
  cd $srcdir/$pkgname-${pkgver//./-}
  make DESTDIR="$pkgdir" install
}
