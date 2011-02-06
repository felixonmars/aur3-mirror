# Contributor: William Rea <sillywilly@gmail.com>
pkgname=sabbu
pkgver=0.3.0
pkgrel=1
pkgdesc="A program used to time subtitles"
url="http://www.sabbu.com"
license="GPL"
depends=('gtk2' 'libsndfile' 'ffmpeg')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('c380b921301cb9cebac117783083f846')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -p0 -i new_ffmpeg.diff
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
