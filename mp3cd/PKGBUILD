##
# Maintainer: Todd Harbour <aur @AT@ quadronyx .DOT. org>
# Comments: 
# Binary version available from: http://www.quadronyx.org/aur/
##

pkgname=mp3cd
pkgver=1.027
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Command line script for burning audio CDs from MP3s, OGGs, FLACs and WAVs"
license=('GPL' 'PerlArtistic')
makedepends=('perl-config-simple')
depends=(
	'perl'
	'sox'
	'cdrdao'
	'gstreamer0.10'
	'normalize')
optdepends=(
	'oggdec: Ogg file decoding'
	'flac: Flac file decoding'
)
url="http://outflux.net/unix/software/mp3cd/"
source=("$url/download/$pkgname-$pkgver.tar.gz")
md5sums=('b694441ff5fa80127bce0708250b7e18')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL
	make

	# Gstreamer's gst-launch appears to be called gst-launch-0.10
	sed -i 's/gst-launch/gst-launch-0.10/g' scripts/mp3cd

	make install DESTDIR="${pkgdir}/"
	find "${pkgdir}/" -name '.packlist' -delete
	find "${pkgdir}/" -name '*.pod' -delete
}
