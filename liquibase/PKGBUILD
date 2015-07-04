# $Id$
# Maintainer: Andreas Pieber <anpieber@gmail.com>

pkgname=liquibase
pkgver=3.4.0
pkgrel=1
pkgdesc="A database management tool"
arch=('any')
url="http://www.liquibase.org/"
license=('APACHE')
depends=('java-environment')
source=(https://github.com/liquibase/liquibase/releases/download/liquibase-parent-$pkgver/liquibase-$pkgver-bin.tar.gz
	liquibase.sh)
md5sums=('77997fc89a65fa904a3008f6a401439b'
         'c484d4bb165302b261c96dcd2acc6da9')

package() {
  # create folders
  mkdir -p $pkgdir/opt/liquibase

  # install profile file
  install -D -m 755 $srcdir/liquibase.sh $pkgdir/etc/profile.d/liquibase.sh

  # move liquibase tar content to /opt/liquibase
  cp -r $srcdir/* $pkgdir/opt/liquibase

  # make liquibase executable
  chmod +x $pkgdir/opt/liquibase/liquibase

  # remove created, but not required data
  rm liquibase-$pkgver-bin.tar.gz
  rm liquibase.sh
}
