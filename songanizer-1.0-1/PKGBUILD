# Contributor: Arjun Shankar <arjunsha@gmail.com>
pkgname=songanizer
pkgver=1.0
pkgrel=1
license=('GPL')
pkgdesc="Organizes a directory containing a collection of Ogg Vorbis and MP3 files"
depends=('libextractor' 'gettext')
source=(ftp://ftp.gnu.org/gnu/$pkgname/v$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('42015f22581e04fca305b096639ae841')
url="http://www.gnu.org/software/songanizer/"

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --without-included-gettext
	make || return 1
	make prefix=$startdir/pkg/usr install
}
