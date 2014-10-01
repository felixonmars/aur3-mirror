# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Alexander Blinne <alexander@blinne.net>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=ffmpeg-compat2
pkgver=1.2.1
pkgrel=4
pkgdesc="Compatibility package for ffmpeg to provide versions 54 of libavcodec, libavdevice and libavformat, not anymore provided by the ffmpeg package"
arch=('i686' 'x86_64')
url="http://ffmpeg.org/"
license=('GPL')
depends=('ffmpeg' 'jack' 'x264')
makedepends=('libvdpau' 'yasm')
source=("http://ffmpeg.org/releases/${pkgname%-*}-${pkgver}.tar.bz2"
        "freetype2.patch")
sha256sums=('0302375c3a64e9c2facfa7cbeb1aa333a39fdf6bbacda228cd48e04bf9ee32ca'
            '03e7e303f864e04ad1cae1af82c0179e111f9ef580634c72a315f22589a6d2ea')

prepare() {
  cd "${pkgname%-*}-${pkgver}"
  patch -p1 -i "${srcdir}/freetype2.patch"
}

build() {
  cd "${pkgname%-*}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --incdir="/usr/include/${pkgname}" \
    --shlibdir="/usr/lib/${pkgname}" \
    --libdir="/usr/lib/${pkgname}" \
    --disable-debug \
    --disable-static \
    --enable-avresample \
    --enable-dxva2 \
    --disable-fontconfig \
    --enable-gpl \
    --enable-libass \
    --enable-libbluray \
    --enable-libfreetype \
    --enable-libgsm \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-librtmp \
    --enable-libschroedinger \
    --enable-libspeex \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libx264 \
    --enable-libxvid \
    --enable-postproc \
    --enable-runtime-cpudetect \
    --enable-shared \
    --enable-vdpau \
    --enable-version3 \
    --enable-x11grab \
    --disable-doc \
    --disable-programs
  [ -e "libx264.so.129" ] && rm "libx264.so.129"
  ln -s "/usr/lib/libx264.so" "libx264.so.129"
  LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:.:libavcodec" make
}

package() {
  cd "${pkgname%-*}-${pkgver}"
  install -d -m 755 "${pkgdir}/usr/lib/ffmpeg-compat2"
  make DESTDIR="${pkgdir}" \
    install-libs \
    install-libavcodec-pkgconfig \
    install-libavdevice-pkgconfig \
    install-libavfilter-pkgconfig \
    install-libavformat-pkgconfig \
    install-libavresample-pkgconfig \
    install-libavutil-pkgconfig \
    install-libpostproc-pkgconfig \
    install-libswresample-pkgconfig \
    install-libswscale-pkgconfig
  ln -s /usr/lib/libx264.so "${pkgdir}/usr/lib/ffmpeg-compat2/libx264.so.129"
  install -d -m 755 "${pkgdir}/etc/ld.so.conf.d/"
  echo -e "/usr/lib/\n/usr/lib/${pkgname}/" > "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"
  install -d -m 755 "${pkgdir}/usr/lib"
}

