# Mantainer: Andrey Mivrenik <6c86742e@opayq.com>
#
# After installing, make sure that your webserver have
# read and write privileges in the todoyu directory!!
#
# Also, you will probably have to manually enable some
# PHP extensions in /etc/php/php.ini
# Required PHP extensions:
#     mbstring, zlib, mcrypt, zip, json, 
#     pcre, libxml, SimpleXML, gd
#
# For more information read '__HOW_TO_INSTALL.txt' in
# the todoyu directory.

pkgname=todoyu
pkgver=2.3
_realver=2-3-0
pkgrel=1
pkgdesc="A business application for project planning, tracking its progress and for communicating with team members. Define deadlines, assign tasks and communicate with your project team and clients until projects are done."
arch=('any')
url="http://www.todoyu.com"
license=('BSD')
depends=('php' 'mysql' 'php-gd' 'php-mcrypt' 'zip')
backup=(srv/http/$pkgname/config/img/logo.png \
        srv/http/$pkgname/config/config.php \
        srv/http/$pkgname/config/db.php \
        srv/http/$pkgname/config/extconf.php \
        srv/http/$pkgname/config/extensions.php \
        srv/http/$pkgname/config/override.php \
        srv/http/$pkgname/config/settings.php \
        srv/http/$pkgname/config/system.php)
source=(http://downloads.sourceforge.net/project/todoyu/todoyu%202.3/todoyu_${_realver}.zip)
md5sums=('531c07298bd64f505d24b5ed11cdc1d7')

package() {
  local _wwwroot=`grep ^DocumentRoot /etc/httpd/conf/httpd.conf | sed 's|DocumentRoot ||' | sed 's|"||g'`
  if [ -z $_wwwroot ] ; then
    _wwwroot="/srv/http"
  fi
  
  instdir=$pkgdir$_wwwroot/$pkgname
  licensedir=$pkgdir/usr/share/licenses/$pkgname/
  mkdir -p $licensedir
  cp -ra $srcdir/LICENSE* $licensedir
  mkdir -p $instdir
  rm $srcdir/*.zip
  cp -ra $srcdir/* $instdir
}
