# Maintainer: Stephen Zhang <zsrkmyn at gmail at com>
pkgname=stm32flash
pkgver=0.4
pkgrel=1
pkgdesc="Open source flash program for the STM32 ARM processors using the ST bootloader."
arch=('i686' 'x86_64')
url="http://code.google.com/p/stm32flash/"
license=('GPL2')
provides=('stm32flash-svn' 'stm32flash-git')
conflicts=('stm32flash-svn' 'stm32flash-git')
install=
source=("https://releases.stm32flash.googlecode.com/git/${pkgname}-${pkgver}.tar.gz")
md5sums=('ec9b5c8bae67f9a489786546d088bd14')


build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	install -d $pkgdir/usr/share/man/man1
	cd "$srcdir/$pkgname"
	make PREFIX="$pkgdir/usr/" install
}
