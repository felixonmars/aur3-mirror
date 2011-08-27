# Maintainer: Zerial <fernando@zerial.org>

pkgname=wuzzah
pkgver=0.53
pkgrel=1
pkgdesc="Inobtrusively monitor your friends"
arch=('i686')
url="http://www.cs.swarthmore.edu/~finney/proj/wuzzah/"
license=('GPL')
source=(http://www.cs.swarthmore.edu/~finney/proj/wuzzah/$pkgname-src.tgz)
md5sums=('559615c912bcf43047d2c11a29c10975')
depends=('glibc')
build() {
	 cd ${srcdir}/${pkgname}
	./configure --prefix=/usr/
	make || return 1
	make DESTDIR=$startdir/pkg install

}
