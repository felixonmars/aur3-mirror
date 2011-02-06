# Contributor: Justin Cameron <justin.cameron@gmail.com>
pkgname=cdmp3
pkgver=0.5.0
pkgrel=1
pkgdesc="Converts audio CDs into MP3 or Ogg Vorbis files on-the-fly."
url="http://www.roland-riegel.de/cdmp3"
license="GPLv2"
depends=('cdparanoia' 'lame' 'cddb_get' 'cdrkit' 'vorbis-tools')
source=(http://www.roland-riegel.de/cdmp3/cdmp3-$pkgver.tar.gz)
md5sums=('ef198e4153deb25b66a2f420af10c698')

build() {
	mkdir -p $startdir/pkg/usr/bin
	install -D -m755 $startdir/src/cdmp3-$pkgver/cdmp3 $startdir/pkg/usr/bin/cdmp3
}

