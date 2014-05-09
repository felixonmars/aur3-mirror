pkgname=glcs
pkgver=0.6.2
pkgrel=2
pkgdesc="An ALSA & OpenGL capture & streaming tool for Linux"
arch=("i686" "x86_64")
url="https://github.com/lano1106/glcs"
source=(
  "git://github.com/lano1106/glcs.git#branch=$pkgver"
  "git://github.com/nullkey/elfhacks.git#branch=stable"
  "git://github.com/lano1106/glcs-packetstream.git"
  "git://github.com/lano1106/glcs-support.git")
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP')
license=("GPL3")
depends=("libpng" "alsa-lib" "libgl" "libxxf86vm")
makedepends=("cmake" "mesa")
conflicts=("glc-git" "glc")
mods=("elfhacks" "packetstream" "../glcs")
backup=("usr/share/glcs/scripts/capture.sh"
        "usr/share/glcs/scripts/pipe_ffmpeg.sh"
        "usr/share/glcs/scripts/webcam_overlay_mix_audio.sh")

if test "$CARCH" == x86_64; then
	optdepends=('lib32-glcs: Support for 32-bit applications such as Wine')
fi

prepare() {
	cd glcs
	git submodule init
	git config submodule.elfhacks.url $srcdir/elfhacks
	git config submodule.packetstream.url $srcdir/glcs-packetstream
	git config submodule.support.url $srcdir/glcs-support
	git submodule update
}

build() {
	cd $srcdir/glcs

	DESTDIR=$pkgdir/usr
	if [ $CARCH == "x86_64" ]; then
		CFLAGS="$CFLAGS -m64"
	fi
	./build.sh $DESTDIR || return 1;
}

package() {
	cd $srcdir/glcs
	DESTDIR=$pkgdir/usr
	./package.sh $DESTDIR || return 1;
}

