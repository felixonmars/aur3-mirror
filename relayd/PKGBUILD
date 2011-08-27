# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=relayd
pkgver=20040322
pkgrel=2
pkgdesc="Relay Rate Limit Daemon"
url="http://dizzy.roedu.net/relayd/"
license="GPL"
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
arch=('i686')
install=
source=(http://dizzy.roedu.net/relayd/$pkgname-$pkgver.tar.bz2 \
        Makefile relayd.init relayd.runit)
        
md5sums=('f47bf4b9f49493ef8bf4d9dd2cacedb1' '23e86ac7c178e7a39f6a5b7fd314fece'\
         'e6a7115d13964665adea1217ff03bf8d' '1378ea50c5d8f780bf22cc02096b9438')

build() {
  cp Makefile $startdir/src/$pkgname-$pkgver
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  make DESTDIR=$startdir/pkg install
  
  install -d $startdir/pkg/etc/rc.d
  install -m 0755 ../relayd.init $startdir/pkg/etc/rc.d/relayd

  install -d $startdir/pkg/etc/sv/relayd
  install -m 0755 ../relayd.runit $startdir/pkg/etc/sv/relayd/run
}
