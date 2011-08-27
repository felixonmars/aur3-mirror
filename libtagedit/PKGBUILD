# Contributor: Xupeng Yun <recordus@gmail.com>
pkgname=libtagedit
pkgver=1.1.1
pkgrel=1
pkgdesc="C++ libs and python bindings for editing ID3V2 tag of mp3, flac and ogg files. "
url="http://sourceforge.net/projects/libtagedit"
license="GPL"
depends=(libogg python sip)
makedepends=(pkgconfig)
source=("http://puzzle.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=("9ac27070e929dc549ac2ac6a37f2e2ee")

build(){
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  cd python-bindings
  python configure.py
  make || return 1
  make DESTDIR=$startdir/pkg install
}
