pkgname=ibus-table-yinma
pkgver=1.2.0.20100305
pkgrel=1
pkgdesc="Provides ZiRanMa Yong Wu Erbi, etc tables for IBus."
arch=('any')
url="http://code.google.com/p/ibus/"
license=('LGPL')
depends=('ibus-table>=1.2.0')
conflicts=()
makedepends=('')
options=('!libtool')
source=(http://ibus.googlecode.com/files/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --libexecdir=/usr/lib/ibus \
  make || return 1
  make DESTDIR="$pkgdir/" install
}

md5sums=('8514c168bf6bfdc6f7600aa1fcd92ee6')
