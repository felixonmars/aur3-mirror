# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=twcw
pkgver=2.0
pkgrel=2
pkgdesc="Morse Code Serial Port Terminal & Keyboard extension for Cwirc"
arch=('i686' 'x86_64')
url="http://wa0eir.home.mchsi.com/$pkgname.html"
license=('GPL')
depends=('lesstif' 'libxpm')
makedepends=('automake')
source=(http://wa0eir.home.mchsi.com/src/$pkgname-$pkgver.src.tar.gz \
		desktop.patch Makefile.am)

build() {
	cd $srcdir
	patch -p1 < desktop.patch
	cd $pkgname-$pkgver
	
	cp -a ../Makefile.am .
	
	automake
	
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install
}
md5sums=('b10a7c02da9087bafbb68f11fadebf2f'
         '8fbbf187f3fa3ac6ae9e7335340d537a'
         '0ada4c752c4050ae1844213849a235d4')
sha256sums=('a0bab2d5794efbbea738f03d4798f77adbd82e1667dc561bc3c07e3234bb9337'
            '2b38ab35bcf1ffff9432ef3d4e4f6f21755d1b4c29611656e6f7068870ffd726'
            'eedab5b782d93e0d7295f6b3aaa6d3ccc3f61f15bd902660c471e25a4e6502e9')
