#Contributor: Víctor Martínez Romanos <vmromanos@gmail.com>
pkgname=vcd-db
pkgver=0.991
_progver=0991
pkgrel=1
pkgdesc="Web based movie catalog software"
url="http://vcddb.konni.com"
depends=('php' 'mysql' 'libmysqlclient')
license=('GPL')
arch=('i686' 'x86_64')
install=vcddb.install
backup=('home/httpd/html/vcddb/classes/VCDConstants.php' \ 
	'home/httpd/html/vcddb/config.php')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/vcddb-$_progver.tar.gz)
md5sums=('678a2be49c3c52e2859dbe3d401acf92')

build() {
  instdir=$startdir/pkg/home/httpd/html/vcddb
  mkdir -p $instdir
  cd $instdir
  cp -r $startdir/src/vcddb/* .
  rm README CHANGELOG
  chmod 0777 upload
  chmod 0777 upload/cache
  chmod 0777 upload/covers
  chmod 0777 upload/nfo
  chmod 0777 upload/pornstars
  chmod 0777 upload/screenshots/albums
  chmod 0777 upload/screenshots/generated
  chmod 0777 upload/thumbnails
}
