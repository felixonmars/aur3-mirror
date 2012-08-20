# Maintainer: orbisvicis <''.join(chr(ord(c)-1) for c in "pscjtwjdjtAhnbjm/dpn")>
pkgname=context-free-hg
pkgver=261
pkgrel=1
pkgdesc="A digital art program that generates images from context free design grammar (CFDG) files"
arch=("i686" "x86_64")
url="http://www.contextfreeart.org/"
license=("GPL2")
depends=("libpng" "gcc-libs")
makedepends=("mercurial" "flex" "bison")
provides=("${pkgname%-hg}" "contextfree" "cfdg")
conflicts=("${pkgname%-hg}" "contextfree" "cfdg")

_hgrepo="${pkgname%-hg}"
_hgroot="https://code.google.com/p"

_ffmpeg_version="0.7.13"
source=("http://ffmpeg.org/releases/ffmpeg-${_ffmpeg_version}.tar.bz2")
sha256sums=("c9450705aba65dce8c02dcbb80a307ba182eeddc752333a7f42dd81fe78c0964")

setup_ffmpeg_static() {
  cd "${srcdir}/ffmpeg-${_ffmpeg_version}"
  ./configure --prefix="/usr" \
    --enable-memalign-hack \
    --enable-gpl \
    --disable-w32threads \
    --disable-doc \
    --disable-ffmpeg \
    --disable-pthreads \
    --disable-swscale-alpha \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-ffserver \
    --disable-avdevice \
    --disable-postproc \
    --disable-avfilter \
    --disable-everything \
    --enable-encoder=qtrle \
    --enable-encoder=rawvideo \
    --enable-muxer=mov \
    --disable-network \
    --disable-dct \
    --disable-mdct \
    --disable-rdft \
    --disable-fft \
    --enable-protocol=file
  make
  make DESTDIR="${srcdir}/${_hgrepo}-build/src-ffmpeg/install" install

  cd "${srcdir}/${_hgrepo}-build/src-ffmpeg"
  rm -rf include lib32 lib64
  ln -s "install/usr/include" "include"
  ln -s "install/usr/lib" "lib"
}

build(){
  cd "$srcdir"

  rm -rf "${srcdir}/${_hgrepo}-build"
  cp -r "${srcdir}/${_hgrepo}" "${srcdir}/${_hgrepo}-build"
  cd "${srcdir}/${_hgrepo}-build"

  ( setup_ffmpeg_static )
  sed -i 's/^LIBS\s\+=.*/\0 m/' Makefile
  make
}

package() {
  cd "${srcdir}/${_hgrepo}-build"

  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 -t "${pkgdir}/usr/bin" cfdg

  install -m755 -d "${pkgdir}/usr/share/${pkgname}/examples"
  install -m644 -t "${pkgdir}/usr/share/${pkgname}/examples" input/*.cfdg
}

# vim:set ts=2 sw=2 et:
