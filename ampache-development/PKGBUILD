#Contributor: Jonathan 'gishten' Gustafsson <mynick AT mynick DOT com>
pkgname=ampache-development
pkgver=3.6_alpha1
pkgrel=1
pkgdesc="A PHP-based tool for managing and playing your audio/video files via a web interface"
arch=('i686' 'x86_64')
url="http://www.ampache.org/"
depends=('mysql>=5.0' 'php>=5.2')   
optdepends=('lame: all transcoding/downsampling'
		'vorbis-tools: all transcoding'
		'flac: flac transcoding/downsampling'
		'faad2: m4a transcoding/downsampling'
		'mp3splt: mp3 and ogg transcoding/downsampling')
license=('GPL')
backup=(srv/html/ampache/config/ampache.cfg.php)
install=ampache.install
source=(http://ampache.org/downloads/ampache-${pkgver//_/-}.tar.gz)
md5sums=('d9845bf0e351e46275717e050d33579b')


build() {
  instdir=$startdir/pkg/srv/http/$pkgname
  mkdir -p $instdir
  cd $instdir
  cp -a $startdir/src/ampache-${pkgver//_/-}/* .
}


