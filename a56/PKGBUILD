# Maintainer: 謝致邦<Yeking@Red54.com>

pkgname=a56
pkgver=1.3
pkgrel=2
pkgdesc='Motorola DSP56001 assembler'
arch=('i686' 'x86_64')
url='http://www.zdomain.com/a56.html'
license=('MIT')
source=(http://www.zdomain.com/a56/a56v$pkgver.tar.gz
'a56.patch')
md5sums=('ac4f015a1f513cc67525233bbe53acea'
'fd75409108f60142497fa7d209fcef15')

build() {
	cd $srcdir
	patch -Np0 -i a56.patch
	make
}

package() {
	cd $srcdir
	install -D a56 $pkgdir/usr/bin/a56
	install -D keybld $pkgdir/usr/bin/keybld
	install -D toomf $pkgdir/usr/bin/toomf
	install -D README-$pkgver $pkgdir/usr/share/licenses/$pkgname/README
}
