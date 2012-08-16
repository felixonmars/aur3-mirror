# Maintainer: Michiel Broek <mbse at mbse eu>
# http://www.mbse.eu/downloads
pkgname=('mysql-zrm')
pkgver=2.2.0
pkgrel=1
pkgdesc="Zmanda recovery manager for MySQL"
arch=('any')
license=('custom')
backup=('etc/mysql-zrm/mysql-zrm.conf' 'etc/mysql-zrm/mysql-zrm-reporter.conf' 'etc/xinetd.d/mysql-zrm-socket-server')
depends=('perl-dbd-mysql' 'perl-dbi' 'perl-xml-parser' 'xinetd')
url="http://www.zmanda.com"
source=("http://www.zmanda.com/downloads/community/ZRM-MySQL/2.2/Source/MySQL-zrm-$pkgver.tar.gz")
md5sums=('913682241e097133ff90dcf85812ff8a')

build() {
  cd $pkgdir

  cp -a $srcdir/MySQL-zrm-$pkgver/etc .
  cp -a $srcdir/MySQL-zrm-$pkgver/usr .
  cp -a $srcdir/MySQL-zrm-$pkgver/var . 
}


# vim:set ts=2 sw=2 et:
