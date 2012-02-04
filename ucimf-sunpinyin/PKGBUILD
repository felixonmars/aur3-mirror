# Maintainer: Yangtse Su  <yangtsesu@gmail.com>

pkgname=ucimf-sunpinyin
pkgver=0.5
pkgrel=2
pkgdesc="Ucimf  Wrapper for sunpinyin."
arch=("i686" "x86_64")
license=('GPL')
url="http://code.google.com/p/ucimf/"
depends=('sqlite3' 'libucimf>=2.3.7' 'sunpinyin')
source=("http://ucimf.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('435988b3d2038a9f59d0af59d175c733')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=${startdir}/pkg install || return 1
}
