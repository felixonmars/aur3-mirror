# Maintainer : pablonicolas.diaz|-at-|gmail.com

pkgname=phpbb2-style-adinfinitum
pkgver=2.0.21
pkgrel=3
pkgdesc="A high powered, fully scalable, and highly customisable open-source bbs package. AdInfinitum Style"
arch=("any")
url="http://www.phpbb.com"
license=('GPL')
depends=('php' 'mysql' 'phpbb2')
backup=(srv/http/phpBB3/.htaccess \
        srv/http/phpBB3/config.php)
source=(http://www.phpbb.com/styles/db/download/2687/adinfinitum.zip)
md5sums=('f01bca788d385ab085af9941aef26ebd')

build() {
  #
  # ###
  local _wwwroot=`grep ^DocumentRoot /etc/httpd/conf/httpd.conf | sed 's|DocumentRoot ||' | sed 's|"||g'`
  if [ -z $_wwwroot ] ; then
    _wwwroot="/srv/http"
  fi
  # ###
  #

  instdir=$startdir/pkg$_wwwroot/phpBB3/styles/AdInfinitum
  mkdir -p $instdir
  cd $instdir
  cp -ra ${srcdir}/AdInfinitum/* .
}
