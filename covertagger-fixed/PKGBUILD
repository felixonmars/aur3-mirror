# Maintainer: m1kc <m1kc@yandex.ru>

pkgname=covertagger-fixed
pkgver=1.0
pkgrel=2
pkgdesc="Add and remove cover images from your mp3s (fixed version)"
url="http://www.musaraigne.net/covertagger/"
license=("GPL")
arch=("i686" "x86_64")
depends=("taglib" "openssl")
source=('COPYING' 'covertagger.cpp' 'Makefile' 'README')
md5sums=('d32239bcb673463ab874e80d47fae504'
         '95125aba32c1030fa795f2c410657f28'
         '44284258d426b386e0d2c99cf7dc1a3a'
         'f2ec582b2b2bdafde94ab775e931814f')

build() {
	cd $srcdir
	make || return 1
}

package() {
	mkdir -p $pkgdir/usr/bin
	cp -v $srcdir/covertagger $pkgdir/usr/bin
}
