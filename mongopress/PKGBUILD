pkgname=mongopress
pkgver=0.2.3
pkgrel=0
pkgdesc='HIGH-PERFORMANCE NOSQL WEB MANAGEMENT'
arch=('any')
url='http://mongopress.org/'
license=('GPL')
depends=('php')
makedepends=('subversion')
optdepends=('mongodb: Database server')

_svnroot="http://svn.mongopress.org/versions/$pkgver/"
_svnname="mongopress"

package() {
  cd "$srcdir"
  msg "checkout from svn server ..."
  if [ -d $_svnname ]; then 
    cd $_svnname && svn up
    msg "update Local files"
    cd -
  else
    svn co $_svnroot  $_svnname
  fi

  msg "svn checkout down or server timeout"
  msg "starting make..."

  install -d "$pkgdir/srv/http"
  cp -r $_svnname "$pkgdir/srv/http"
}

post_install() {
  # Make uploads work
  install -dm775 /srv/http/$_svnname/mp-content/uploads
  chown http:http /srv/http/wordpress/mp-content/uploads
  echo 'You can now configure your (PHP compatible) web server to run Mongopress'
}

pre_remove() {
  cp -r /srv/http/$_svnname /srv/http/"$_svnname"_backup
  echo "Your Mongopress folder were backed up to /srv/http/"$_svnname"_backup"
}

post_remove() {
  rm -rf /srv/http/_svnname
}


# vim:set ts=2 sw=2 et:
