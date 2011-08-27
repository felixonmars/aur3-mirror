# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Contributor: Leen Jewel <leenjewel@gmail.com>
pkgname=flare
pkgver=1.0.11
pkgrel=1
pkgdesc="Flare is distributed, and persistent key-value storage compatible w/ memcached."
arch=(i686 x86_64)
url="http://labs.gree.jp/Top/OpenSource/Flare-en.html"
license=('GPL')
depends=('tokyocabinet' 'boost')
source=(http://labs.gree.jp/data/source/flare-$pkgver.tgz)
md5sums=('8be9ac019c8e114bdff246daa82033a6')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --with-boost=/usr/include/boost --with-tokyocabinet=/usr/share/tokyocabinet --prefix=/usr
  make || return 1
  make install
}

