# Contributor: totoloco <totoloco at ushcompu dot com dot ar>
pkgname=sidu
pkgver=3.5
_pkgvernotdot=35
pkgrel=1
pkgdesc="Select - Insert - Delete - Update. Free MySQL - Postgre - SQLite client working via web browser."
arch=("i686" "x86_64")
url="http://sidu.sourceforge.net/"
license=('GPL2')
depends=('php' 'mysql-clients')
install=${pkgname}.install

source=("http://downloads.sourceforge.net/$pkgname/$pkgname$_pkgvernotdot.zip")
md5sums=('94fca5a478703ef37a03e2bff231f09d')

build() {
  install -d $pkgdir/etc/webapps
  cp -Rf $srcdir/sidu$_pkgvernotdot $pkgdir/etc/webapps/$pkgname
  chown -R http:http $pkgdir/etc/webapps/$pkgname
}
