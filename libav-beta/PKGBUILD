pkgname=libav-beta
basename=libav
pkgver=0.8_beta2
pkgrel=1
pkgdesc="A complete, cross-platform solution to record, convert and stream audio and video"
arch=('i686' 'x86_64')
url="http://www.libav.org/"
license=('GPL3' 'LGPL3')
depends=('bzip2' 'zlib' 'alsa-lib' 'vdpau-video')
makedepends=('yasm')
provides=('ffmpeg' 'libav=$pkgver')
conflicts=('ffmpeg')
source=(http://libav.org/releases/$basename-$pkgver.tar.xz)
md5sums=('641123a37430116df332bf08166b735d')

_libvorbis_aotuv=$(pacman -Q libvorbis-aotuv 2>/dev/null | awk '{print $1}')
_lame=$(pacman -Q lame 2>/dev/null | awk '{print $1}')
_options1=""
_options2=""
[ ! -z $_lame ] && _options1="$_options1 --enable-libmp3lame" \
		&& _options2="$_options2 --enable-encoder=libmp3lame"
[ ! -z $_libvorbis_aotuv ] && _options1="$_options1 --enable-libvorbis" \
		&& _options2="$_options2 --enable-encoder=libvorbis"
  
build() {
	cd "$srcdir/$basename-$pkgver"

	./configure \
		--prefix=/usr \
		--enable-gpl \
		--enable-version3 \
		--enable-nonfree \
		--enable-shared --disable-static \
		--enable-pthreads \
		--enable-x11grab \
		--enable-runtime-cpudetect \
		--enable-vaapi \
		--enable-postproc \
		--disable-ffmpeg \
		--disable-avplay \
		--disable-avprobe \
		--disable-avserver \
		--disable-avdevice \
		$_options1 \
		--disable-encoders \
		--enable-encoder=flac \
		--enable-encoder=pcm_s8 \
		--enable-encoder=pcm_s16le \
		--enable-encoder=pcm_s24le \
		--enable-encoder=pcm_s32le \
		--enable-encoder=pcm_f32le \
		$_options2 \
		--disable-debug 
	make
}

package() {
	cd "$srcdir/$basename-$pkgver"
	make DESTDIR="$pkgdir/" install
}
