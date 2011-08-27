#Contributor: Martin CHlumsky <martin.chlumsky@gmail.com>
pkgname=mtpsync
pkgver=0.8
pkgrel=1
pkgdesc="MTPSync is used to syncronize files/music with a MTP device (as supported by libmtp)"
arch=(i686)
url="http://www.adebenham.com/mtpsync/"
depends=('libmtp' 'gtk2' 'gconf' 'libusb' 'readline' 'libid3tag' 'libmad')
source=(http://www.adebenham.com/debian/$pkgname\_$pkgver.orig.tar.gz)
md5sums=('918bb4ca8e29d01efe6e881bdb9ce222')
license="GPL"

build() {
	  cd $startdir/src/$pkgname-$pkgver.orig
#	  ./autogen.sh --prefix=/usr
	./configure --prefix=/usr
	  make || return 1
	  make INSTALL="/bin/install -c" DESTDIR=$startdir/pkg install
	}
