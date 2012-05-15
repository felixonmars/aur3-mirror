pkgname=fnord
pkgver=1.10
pkgrel=11
pkgdesc="Yet another small httpd"
arch=('i686' 'x86_64')
url="http://www.fefe.de/fnord/"
license=("GPL")
depends=('glibc' 'ipsvd' 'runit')
install=fnord.install
source=(http://www.fefe.de/fnord/$pkgname-$pkgver.tar.bz2
        php.patch
        run
        run.log)
md5sums=('4c7d9f0e2b2f071d4687688f3018ba91'
         'cf021b32442a281a9b0264e2767f74be'
         'e56d87e0d6d29de1c4310c1ff350ebef'
         'c5a660b5ab7fd112ff3f4ba084391af9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/php.patch"
  make DIET="$DIET" CFLAGS="-Os -fomit-frame-pointer -DAUTH"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/usr/bin"
  install -m755 fnord fnord-idx fnord-cgi "$pkgdir/usr/bin"
  install -d "$pkgdir/etc/sv/fnord"
  install -d "$pkgdir/etc/sv/fnord/log"
  install -m755 "$srcdir/run" "$pkgdir/etc/sv/fnord"
  install -m755 "$srcdir/run.log" "$pkgdir/etc/sv/fnord/log"
}
