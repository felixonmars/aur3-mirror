pkgname=ffingerd
pkgver=1.28
pkgrel=4
pkgdesc="secure finger daemon"
arch=('i686' 'x86_64')
url="http://www.fefe.de/ffingerd/"
license=('GPL2')
depends=('glibc' 'xinetd')
backup=('etc/xinetd.d/ffinger')
source=(http://www.fefe.de/$pkgname/$pkgname-$pkgver.tar.bz2
        finger.xinetd)
md5sums=('fe207448745da07b4e393d8b8694658b'
         '2ca1a6b3f442a5c0c81fa03d265a203e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/sbin" "$pkgdir/usr/share/man/man8"
  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make SBINDIR="$pkgdir/usr/sbin" MANDIR="$pkgdir/usr/share/man" install
  install -D -m644 "$srcdir/finger.xinetd" "$pkgdir/etc/xinetd.d/ffinger"
}
