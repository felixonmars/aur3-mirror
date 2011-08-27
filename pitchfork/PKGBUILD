# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=pitchfork
pkgver=0.5.5
pkgrel=4
pkgdesc="A web client for MPD written in PHP and Ajax"
license=('GPL')
url="http://mpd.wikia.com/wiki/Client:Pitchfork"
arch=('i686' 'x86_64')
depends=('php>=5.1.3' 'php-apache' 'php-pear')
install=pitchfork.install
source=(http://downloads.sourceforge.net/sourceforge/musicpd/pitchfork-$pkgver.tar.bz2
	pitchfork.conf)
md5sums=('59cab95108b95f06d7da5163aa27e81d'
         '75ef6873a859bf0c10fa14ee16728429')

build() {
  mkdir -p $startdir/pkg/srv/http/pitchfork
  cd $startdir/pkg/srv/http/pitchfork
  cp -a $startdir/src/pitchfork-$pkgver/* .
  chown nobody $startdir/pkg/srv/http/pitchfork/config
  mkdir -p $startdir/pkg/etc/httpd/conf/extra
  cp $startdir/src/pitchfork.conf $startdir/pkg/etc/httpd/conf/extra
}
