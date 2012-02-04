pkgname=videodb
pkgver=2.2.2
pkgrel=1
pkgdesc="VideoDB is a database to manage your personal video collection. It uses PHP and MySQL and features fetching Movie data from the Internet Movie Database (IMDb)."
arch=("i686" "x86_64")
url="http://videodb.sourceforge.net/"
depends=('php' 'mysql')
backup=(home/httpd/html/videodb/config.inc.php)
source=(http://puzzle.dl.sourceforge.net/sourceforge/videodb/videodb-2_2_2a.tgz)
md5sums=(bda7dc5ee3a0f26cf8f99352cce74eac)

build() {
  instdir=$startdir/pkg/home/httpd/html/videodb
  mkdir -p $instdir
  cd $instdir
  cp -ra $startdir/src/videodb/* .
}


