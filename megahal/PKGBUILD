# Contributor:  Thomas Mudrunka <harvie@@email..cz>
# Maintainer:   Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=megahal
pkgver=9.1.1
pkgrel=1
pkgdesc="conversation simulator: a computer program which responds in natural language to what you type"
arch=('i686' 'x86_64')
url="http://megahal.alioth.debian.org/"
license=("GPL")
depends=(gcc-libs)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('acdca9ada85cb7fc49dbe2dd8e6b4fca')

build() {
	mkdir -p $pkgdir/usr/bin
  cd $srcdir/$pkgname-$pkgver/
  make
	cp megahal $pkgdir/usr/bin
}
