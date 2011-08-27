# Previous contributor: Michael Fellinger <m.fellinger@gmail.com>
# Contributor: Andrei Antoukh <niwi@niwi.be>

pkgname=couchdb-svn
pkgver=952732
pkgrel=1
pkgdesc="Schema-free document-oriented database accessible via a RESTful HTTP/JSON API."
arch=(any)
url="http://couchdb.apache.org/index.html"
license=('APACHE')
makedepends=(gcc help2man svn)
depends=(erlang icu spidermonkey curl)
conflicts=(couchdb)
replaces=(couchdb)
provides=(couchdb)
backup=(/etc/conf.d/couchdb /etc/couchdb/local.ini)
source=(couchdb.install)
md5sums=('896be6a5cb235a1064cc93460ad1ebac')

_svntrunk=http://svn.apache.org/repos/asf/couchdb/trunk
_svnmod=couchdb

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk  $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
  cd "$srcdir/$_svnmod"

  ./bootstrap
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var

  make || return 1
  make DESTDIR="$pkgdir" install

  mkdir -p $pkgdir/var/run/couchdb
  install -Dm755 etc/default/couchdb $pkgdir/etc/conf.d/couchdb

  # correct location of configuration used for /etc/rc.d/couchdb
  sed -i 's|\(CONFIGURATION_FILE=/etc/\)default\(/couchdb\)|\1conf.d\2|' $pkgdir/etc/rc.d/couchdb
  # use a shell for su, we create the account with /bin/false as shell
  sed -i 's|\(su $COUCHDB_USER\) -c|\1 -s /bin/bash -c|' $pkgdir/etc/rc.d/couchdb
  # use a .pid, couchdb freaks out without it
  sed -i 's|\(COUCHDB_OPTIONS=\)|\1"-p /var/run/couchdb/couchdb.pid"|' $pkgdir/etc/conf.d/couchdb
}
