# Maintainer: Gunnar Kriik <gunnar.kriik@gmail.com>
# Maintainer: lilydjwg <lilydjwg@gmail.com>

pkgname=udt-lily
pkgver=4.10
pkgrel=1
pkgdesc="A reliable UDP based application level data transport protocol for distributed data intensive applications over wide area high-speed networks. With executables."
arch=('i686' 'x86_64')
url="http://udt.sourceforge.net"
license=('custom')
source=(http://downloads.sourceforge.net/udt/udt.sdk.$pkgver.tar.gz)
md5sums=('6bb2d8454d67c920eb446fddb7d030c4')

build() {
  cd $srcdir/udt4

  make || return 1

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include/udt
  mkdir -p $pkgdir/usr/share/licenses/$pkgname

  install -m755 src/libudt.so $pkgdir/usr/lib
  install -m755 app/appserver $pkgdir/usr/bin/udt_appserver
  install -m755 app/appclient $pkgdir/usr/bin/udt_appclient
  install -m755 app/sendfile $pkgdir/usr/bin/udt_sendfile
  install -m755 app/recvfile $pkgdir/usr/bin/udt_recvfile
  install -m644 src/*.h $pkgdir/usr/include/udt

  install -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/
}
