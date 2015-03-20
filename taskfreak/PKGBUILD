# Maintainer: freaknils <freaknils@gmail.com>
# Contributor: freaknils

pkgname=taskfreak
pkgver=0.6.4
pkgrel=1
pkgdesc='Simple task management web software'
arch=('any')
url='http://www.taskfreak.com/'
license=('GPLv3')
depends=('php')
source=("http://www.taskfreak.com/files/beta/${pkgname}-multi-mysql-${pkgver}.tgz")
md5sums=('506353f583a7bfc0a9d2b0b054d03e52')

package() {
  cd "$pkgdir"
  install -dm0755 usr/share/webapps etc/webapps etc/webapps/taskfreak
  cp -a "$srcdir"/$pkgname-${pkgver} usr/share/webapps/taskfreak

  # move config in /etc
  mv usr/share/webapps/taskfreak/include/config.php etc/webapps/taskfreak
  chmod g=rwx etc/webapps/taskfreak
  ln -s ../../../../../etc/webapps/taskfreak/config.php usr/share/webapps/taskfreak/include/config.php

  # fix rights and ownership
  chown -R http:http etc/webapps/taskfreak

  # php.ini
  install -dm0755 $pkgdir/etc/php/conf.d/
  echo 'open_basedir = ${open_basedir}:/etc/webapps/taskfreak/' >$pkgdir/etc/php/conf.d/taskfreak.ini
}

# vim:set ts=2 sw=2 et:
