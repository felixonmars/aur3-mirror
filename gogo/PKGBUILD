# Contributor: mamimu.orz <mamimu.orz@gmail.com>

pkgname=gogo
pkgver=3.13
pkgrel=1
pkgdesc="GOGO-no-coda ver. 3.13 ( May. 20 2004 ) is a mp3 encoder based on lame 3.88"
arch=('i686')
url="http://www.marinecat.net/free/windows/mct_free.htm"
license=('LGPL')
depends=('nasm')
source=('http://www.marinecat.net/cgi/lcount/count.cgi?page=3131&name=petit313-src.tgz&downex=petit313.tgz' './remove_f.patch')
md5sums=('2442afa6bd4329c489a73aa8f01475ba' '0cf01d1a9108ce1527759b1af7ee42c1')

build() {
  tar zxvf "count.cgi?page=3131&name=petit313-src.tgz&downex=petit313.tgz"
  cd $startdir/src/petit313/
#  sed -e "26,33s/F//g" ./engine/i386/fftsse.nas
  patch -p0 < ../remove_f.patch
  ./configure --prefix=/usr --enable-debug
  make || return 1
  make DESTDIR=${startdir}/pkg install
}

