# Maintainer: Jonathan Arnold <jdarnold@buddydog.org>
pkgname="pjsip"
pkgver=2.1
pkgrel=2
pkgdesc="Free and open source multimedia communication library implementing standards-based protocols such as SIP, SDP, RTP, STUN, TURN, and ICE"
arch=('i686' 'x86_64')
url="http://www.pjsip.org/"
license=('GPL2')
depends=('sdl2' 'ffmpeg' 'openssl' 'portaudio' 'speex' 'alsa-lib' 'libsamplerate' 'util-linux-ng')
makedepends=()
checkdepends=()
optdepends=('x264' 'qt')
provides=('pjsip')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

# Internal source files are in 'pjproject'
_projectname=pjproject

source=(http://www.pjsip.org/release/$pkgver/$_projectname-$pkgver.tar.bz2
	ffmpeg_util.patch)
noextract=()
md5sums=('310eb63638dac93095f6a1fc8ee1f578'
	'5be26a34e38b17a58cf6b31fe75552db')

prepare() {
	cd "$srcdir/$_projectname-$pkgver.0"

	# Set config for video & resample
	echo "#define PJMEDIA_HAS_VIDEO	1" >>"$srcdir/$_projectname-$pkgver.0"/pjlib/include/pj/config_site.h
	echo "#define PJMEDIA_RESAMPLE_IMP PJMEDIA_RESAMPLE_LIBSAMPLERATE" >>"$srcdir/$_projectname-$pkgver.0"/pjlib/include/pj/config_site.h

	# patch for AVCodec change
  	patch -p1 -i "$srcdir/ffmpeg_util.patch"

	# And get libsample include
	mkdir -p "$srcdir/$_projectname-$pkgver.0"/third_party/libsamplerate/src
	cp /usr/include/samplerate.h "$srcdir/$_projectname-$pkgver.0"/third_party/libsamplerate/src
	
}
    
build() {
	cd "$srcdir/$_projectname-$pkgver.0"
	./configure --prefix=/usr --with-external-speex --with-external-pa --disable-oss --enable-libsamplerate

	#Override of -j because this package will not consistently build with multiple processes.
	make -j1 dep
	make -j1
}

package() {
	cd "$srcdir/$_projectname-$pkgver.0"
	make -j1 DESTDIR="$pkgdir/" install
}
