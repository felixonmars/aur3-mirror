# Contributor: Nathan Owe. <ndowens04+AUR@gmail.com>
pkgname=mysql-maint
pkgver=1.0.1
pkgrel=1
pkgdesc="Bash Script for backup/maintenance of MySQL"
arch=('i686')
url="http://code.google.com/p/mysql-main/"
license=('GPL3')
depends=('bash' 'mysql')
source=(http://mysql-maint.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('8b210f71c26af9dd030b224bac5bef05') 

build() {
  cd $srcdir/$pkgname-$pkgver

 install -d $pkgdir/usr/bin
 install -m755 mysql_maint.sh $pkgdir/usr/bin/mysql-maint
}

# vim:set ts=2 sw=2 et:
