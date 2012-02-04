# Contributor: Alexander 'hatred' Drozdoff <adrozdoff@gmail.com>
pkgname=wtorrent-svn
pkgver=109
pkgrel=1
pkgdesc="Web interface to rtorrent a high performance console based BitTorrent client."
arch=(any)
url="http://www.wtorrent-project.org/trac/"
license=('GPL')
depends=('rtorrent' 'php' 'php-sqlite' 'php-curl')
optdepends=('apache: for WEB access to wTorrent'
            'mod_scgi: SCGI module for apache, need for work with Apache (take from AUR)'
            'php-apache: PHP module for Apache, need for work with Apache'
            'lighttpd: alternate WEB server for wTorrent, it contained SCGI module'
            'php-cgi: CGI version of PHP, need to work with lighttpd')
makedepends=('subversion')
backup=(srv/http/wtorrent/conf/user.conf.php srv/http/wtorrent/conf/system.conf.php)
source=(httpd-wtorrent.conf user.conf.php)
install=wtorrent.install

_svntrunk=http://wtorrent-project.googlecode.com/svn/trunk/wtorrent
_svnmod=wtorrent

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #

  find ./ -name .svn -type 'd' | xargs rm -rf

  mkdir -p $startdir/pkg/srv/http/wtorrent
  cp -r ./* $startdir/pkg/srv/http/wtorrent/
  chmod -R 777 $startdir/pkg/srv/http/wtorrent

  cp ../user.conf.php $startdir/pkg/srv/http/wtorrent/conf

  mkdir -p $startdir/pkg/etc/httpd/conf/extra
  cp ../httpd-wtorrent.conf $startdir/pkg/etc/httpd/conf/extra/
}
md5sums=('5b9de46ffba6e82cbb4c4b5b18214267'
         'e98a4485ee2963fd75b889114ada18a5')
