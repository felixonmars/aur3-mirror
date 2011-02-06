#Contributor: Daniel "weseven" Simionato <weseven@gmail.com>
pkgname=ampache-development
pkgver=3.5.4
pkgrel=1
pkgdesc="Ampache is a PHP-based tool for managing, updating and playing your MP3/OGG/RM/FLAC/WMA/M4A files via a web interface"
arch=("i686" "x86_64")
url="http://www.ampache.org/"
depends=('php' 'mysql')
license='GPL'
backup=(srv/html/ampache/config/ampache.cfg.php)
source=(http://ampache.org/downloads/development.tar.gz)
md5sums=('f07c1d9de1b5887420d698d22be2eb95')

build() {
  instdir=$startdir/pkg/srv/html/ampache
  mkdir -p $instdir
  cd $instdir
  cp -ra $startdir/src/ampache-3.5.4/* .
}


