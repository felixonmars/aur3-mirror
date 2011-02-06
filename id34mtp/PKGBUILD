#Contributor: Kevin Edmonds <edmondskevin@hotmail.com>
pkgname=id34mtp
pkgver=0.0.2c
pkgrel=3
pkgdesc="command line tool for transfering mp3's to devices that use the MTP protocol + supplies MTP metadata read from id3 tags"
url="http://sourceforge.net/projects/id34mtp"
depends=('ncurses' 'libmtp>=0.0.4')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz \
id34mtp.patch)
md5sums=('0ff68c8bbd1c1d69be8e5b09e067b1cc' 'f14d281c7d9eea1a78441bdfd532365f')

build() {
  cd $startdir/src/$pkgname
  patch -Np1 -i ../id34mtp.patch
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

