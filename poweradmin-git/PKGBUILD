# Maintainer: fila@pruda.com
pkgname=poweradmin-git
_gitname=poweradmin
pkgver=2.1.6.287.g6da5709
pkgrel=1
pkgdesc='web-based DNS administration tool for PowerDNS server'
arch=('any')
url='https://github.com/poweradmin/poweradmin'
license=(GPL)
depends=('powerdns' 'php')
makedepends=('git')
source=('git://github.com/poweradmin/poweradmi'n)
md5sums=('SKIP')
backup=('etc/webapps/poweradmin/config.inc.php')


pkgver() {
  cd $_gitname
  git describe | sed 's/^v//;s/-/./g'
}


package() {
  _destdir=$pkgdir/usr/share/webapps/poweradmin
  _destdir_etc=$pkgdir/etc/webapps/poweradmin

  #source
  install -dm755 $_destdir
  cp -r $srcdir/$_gitname/. $_destdir
  
  cd $_destdir
  rm -r .git
  mv install x_install
  chmod 700 x_install
  
  
  #config
  install -dm755 $_destdir_etc
  touch $_destdir_etc/config.inc.php
  ln -s /etc/webapps/poweradmin/config.inc.php $_destdir/inc/config.inc.php
  
}