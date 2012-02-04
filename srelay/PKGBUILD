# Maintainer: Alexandre Becoulet <alexandre.becoulet@free.fr>

pkgname=srelay
pkgver=0.4.7p3
pkgrel=1
pkgdesc="A socks 4/5 protocol proxy server"
arch=('i686' 'x86_64')
url="http://socks-relay.sourceforge.net/"
license=('BSD')
source=(http://ovh.dl.sourceforge.net/project/socks-relay/socks-relay/$pkgname-${pkgver%p*}/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --without-libbind || return 1
  make CFLAGS="-DLINUX" || return 1
  mkdir -p $pkgdir/usr/share/man/man8/
  cat srelay.8 | gzip > $pkgdir/usr/share/man/man8/srelay.8.gz
  mkdir -p $pkgdir/usr/bin/
  cp srelay $pkgdir/usr/bin/
  mkdir -p $pkgdir/etc/
  cp srelay.conf $pkgdir/etc/
  cp srelay.passwd $pkgdir/etc/
}

md5sums=('214ca8bc476c5e0eab54adb01972be6a')

