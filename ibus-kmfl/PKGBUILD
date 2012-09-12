# Maintainer: David Osborne <krendilboove _at_ gmail _dot_ com>
pkgname=ibus-kmfl
pkgver=1.0.3
pkgrel=2
pkgdesc="KMFL engine for IBUS"
arch=('i686' 'x86_64')
url="http://kmfl.sourceforge.net/"
license=('GPL')
depends=('libkmfl' 'ibus')
source=("http://downloads.sourceforge.net/project/kmfl/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz"
        "http://sourceforge.net/tracker/download.php?group_id=130915&atid=719366&file_id=426836&aid=3427695")
md5sums=('d98ed94d49ed2019008f7b4dc4a20e6c' 'c998405a2f943cf5242ad2a44d001d29')

build() {
  cd "$srcdir"
  mv "download.php?group_id=130915&atid=719366&file_id=426836&aid=3427695" "ibus-1.4.0-fix.patch"
  patch -d "$pkgname-$pkgver/src" <ibus-1.4.0-fix.patch
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --libexecdir=/usr/lib/$pkgname
  make DESTDIR="$pkgdir" install
}
