# Contributor: enderst <enderst@gmail.com>
pkgname=kwebget
pkgver=0.8.1
pkgrel=1
pkgdesc="A frontend to the great 'wget'"
license=('GPL')
arch=('i686')
url="http://www.kpage.de/en/"
depends=('kdelibs3' 'wget')
source=(http://www.kpage.de/download/$pkgname-$pkgver.tar.bz2
'stdlib.patch')
md5sums=('0143a6e092da11000bafe6c71912247c'
	 '6f5e566b9ee5e7f5418b81f874a7cf9d')


build() {
  cd $startdir/src/$pkgname
  patch -p1 <$startdir/src/stdlib.patch
  ./configure --with-qt-dir=/opt/qt --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
