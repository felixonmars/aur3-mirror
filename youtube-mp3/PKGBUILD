# Contributor: Tim Rijavec <rico@gama.us>

pkgname=youtube-mp3
pkgver=1
_realname=youtube-mp3
pkgrel=1
pkgdesc="Youtube to MP3 converter"
url="http://gama.us"
arch=('i686')
license=('unknown')
depends=('mplayer' 'youtube-dl')
source=(http://gama.us/sources/00a_01/youtube-mp3.tar)
md5sums=('49a2dce64bdbff567e42bc1d6cd2336a')

build() {
	mkdir $startdir/pkg/usr
	mkdir $startdir/pkg/usr/bin
	cp $startdir/src/youtube-mp3 $startdir/pkg/usr/bin
}
