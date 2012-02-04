# Contributor: lp76 <l.peduto@gmail.com>
pkgname=mysqlreport
pkgver=3.5
pkgrel=1
pkgdesc="A tool that makes a friendly report of important MySQL status values"
arch=('i686')
url="http://hackmysql.com/mysqlreport"
license=('GPL')
depends=('perl-dbd-mysql')
source=(http://hackmysql.com/scripts/$pkgname-$pkgver.tgz)
md5sums=('33a345f5e2c89b083a9ff0423f7fd7b4')

build() {
  cd $startdir/src/$pkgname-$pkgver
  install -D mysqlreport $startdir/pkg/usr/bin/mysqlreport
  install -d $startdir/pkg/usr/share/mysqlreport
  install -D -m644 *.html $startdir/pkg/usr/share/mysqlreport
}
