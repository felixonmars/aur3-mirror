# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=restund
pkgver=0.4.2
pkgrel=1
pkgdesc="A modular and flexible STUN and TURN Server, with IPv4 and IPv6 support"
arch=('i686' 'x86_64')
url="http://www.creytiv.com/"
license=('custom:BSD')
depends=("libre>=$pkgver" 'libmysqlclient')
optdepends=('munin: for monitoring')
backup=("etc/$pkgname.conf")
source=("http://www.creytiv.com/pub/$pkgname-$pkgver.tar.gz" $pkgname{,-args}.sh)
md5sums=('dd58fc56c29f812fc14988412a3bf14a'
         '40ac82d7b1a888b74006a088d48899bc'
         'c3a25a302f927d2906ffa7438d2a9aa7')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # restund.conf module path fix
  sed -i 's/\/local//' etc/$pkgname.conf

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DATADIR=/usr/lib \
       DESTDIR="$pkgdir" install

  # license
  install -Dm644 docs/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # restund.conf
  install -Dm644 etc/$pkgname.conf \
    "$pkgdir/etc/$pkgname.conf"

  # daemon
  install -Dm755 ../$pkgname.sh \
    "$pkgdir/etc/rc.d/$pkgname"

  # daemon conf
  install -Dm644 ../$pkgname-args.sh \
    "$pkgdir/etc/conf.d/$pkgname"
}
