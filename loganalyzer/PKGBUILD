# Maintainer: freaknils <freaknils@gmail.com>
pkgname=loganalyzer
pkgver=3.6.6
pkgrel=3
pkgdesc="rsyslog's native web interface"
arch=('any')
url='http://loganalyzer.adiscon.com/'
license=('GPL')
depends=('php')
backup=('etc/webapps/loganalyzer/.htaccess')
options=('!strip')
source=("http://download.adiscon.com/loganalyzer/loganalyzer-${pkgver}.tar.gz")
md5sums=('979b25330b0a2bb35eb458f634335a76')

package() {
  cd $pkgdir
  
  install -dm0755 usr/share/webapps etc/webapps
  cp -a $srcdir/$pkgname-${pkgver}/src usr/share/webapps/loganalyzer

  # move config in /etc
  mkdir etc/webapps/loganalyzer
  chmod g=rwx etc/webapps/loganalyzer
  touch etc/webapps/loganalyzer/config.php
  ln -s ../../../../../etc/webapps/loganalyzer/config.php usr/share/webapps/loganalyzer/config.php

  # use default htaccess
  mv usr/share/webapps/loganalyzer/.htaccess etc/webapps/loganalyzer/.htaccess
  ln -s /etc/webapps/loganalyzer/.htaccess usr/share/webapps/loganalyzer/.htaccess

  # fix rights and ownership
  chown -R http:http etc/webapps/loganalyzer

  # php.ini
  install -dm0755 $pkgdir/etc/php/conf.d/
  echo 'open_basedir = ${open_basedir}:/etc/webapps/loganalyzer/:/usr/share/webapps/loganalyzer/' >$pkgdir/etc/php/conf.d/loganalyzer.ini
}

# vim:set ts=2 sw=2 et:
