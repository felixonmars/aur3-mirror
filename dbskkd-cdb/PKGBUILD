pkgname=dbskkd-cdb
pkgver=2.00
pkgrel=1
pkgdesc='SKK dictionary server based on cdb'
arch=('x86_64' 'i686')
url='http://code.google.com/p/dbskkd-cdb/'
license=('CCPL:cc-by-3.0' 'BSD')
depends=('xinetd' 'tinycdb')
source=(http://dbskkd-cdb.googlecode.com/files/$pkgname-$pkgver.tar.gz
        $pkgname-$pkgver.diff
        skkserv)
install=dbskkd-cdb.install
md5sums=('ea6536e7f52b0ed315ff0ecb966f5f94'
         '76457a9789f73eed03b7941fabf8b40d'
         'e3d3433df4dc67c934fdbfe71760d152')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np1 -i $srcdir/$pkgname-$pkgver.diff || return 1
  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -D -m755 skktocdbm.sh "$pkgdir/usr/lib/$pkgname/skktocdbm.sh"
  install -D -m755 makeskkcdb.sh "$pkgdir/usr/lib/$pkgname/makeskkcdb.sh"
  install -D -m644 "$srcdir/skkserv" "$pkgdir/etc/xinetd.d/skkserv"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
