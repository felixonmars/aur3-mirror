# Maintainer: TDY <tdy@archlinux.info>

pkgname=cerebro
pkgver=1.16
pkgrel=1
pkgdesc="A collection of cluster monitoring tools and libraries"
arch=('i686' 'x86_64')
url="https://computing.llnl.gov/linux/cerebro.html"
license=('GPL')
options=('!libtool')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        cerebrod.rc
        cerebrod.service)
md5sums=('38a88e4dd2e8303b78654bc9304dc1f3'
         '576a36e2a8ae8bbe000eaf1e8dbc261f'
         'c53a84210309da4ae53e57e04fae7e5b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/init\.d/rc.d/g' etc/Makefile.in
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm755 ../cerebrod.rc "$pkgdir/etc/rc.d/cerebrod"
  install -Dm644 ../cerebrod.service "$pkgdir/usr/lib/systemd/system/cerebrod.service"
}

# vim:set ts=2 sw=2 et:
