pkgname=drupal-cvs
pkgver=20101018
pkgrel=1
pkgdesc="A PHP-based content management platform - CVS Version"
arch=('i686' 'x86_64')
url="http://www.drupal.org/"
license=('GPL')
depends=('php')
install=('drupal-cvs.install')
backup=(srv/http/drupalcvs/.htaccess)

_cvsroot=":pserver:anonymous:anonymous:@cvs.drupal.org:/cvs/drupal"
_cvsmod="drupal"

build() {

 msg "Connecting to $_cvsmod CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z6 -d $_cvsroot co -D -f $_cvsmod
  fi


  mkdir -p $startdir/pkg/srv/http/drupalcvs
  cp -r $startdir/src/$_cvsmod/{*,.htaccess} $startdir/pkg/srv/http/drupalcvs
  echo "deny from all" > $startdir/pkg/srv/http/drupalcvs/.htaccess
}
