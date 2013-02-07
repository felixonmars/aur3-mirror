# Maintainer: Rudolf Polzer <divVerent[at]xonotic[dot]org>
# Original maintainer: DrZaius <lou[at]fakeoutdoorsman[dot]com>

pkgname=ffmpeg-full-git-fixed
pkgver=20130124
pkgrel=1
pkgdesc="Record, convert, and stream audio and video (all codecs; git version). One line fix, changed fdk-aac to libfdk-aac. Also, added x264-git as dependency for convenience. Package uploaded until the author fixes it."
arch=('i686' 'x86_64')
url="http://ffmpeg.org/"
license=('GPL' 'custom:UNREDISTRIBUTABLE')
depends=('faac' 'lame' 'libtheora' 'libva' 'sdl' 'x264-git' 'libass' 'libbluray' 'libcaca' 'libiec61883' 'openal' 'twolame' 'libavc1394' 'xvidcore' 'schroedinger' 'v4l-utils' 'speex' 'opus' 'libvpx' 'jack' 'opencore-amr' 'rtmpdump' 'openjpeg' 'libmodplug' 'gsm' 'libpulse' 'libsoxr-git' 'celt' 'gnutls' 'libdc1394' 'libfdk-aac')
makedepends=('git' 'yasm' 'libnut-git' 'frei0r-plugins' 'vo-aacenc' 'vo-amrwbenc' 'utvideo')
conflicts=('ffmpeg' 'ffmpeg-git')
provides=("ffmpeg=$pkgver" "ffmpeg-git" "qt-faststart")
source=('UNREDISTRIBUTABLE.txt')
md5sums=('4ec62a19aea656375174c04979e05563')
_gitroot="git://git.videolan.org/ffmpeg"
_gitname="ffmpeg"

build() {
  cd "$srcdir"
  msg "Connecting to the Git repository..."
  
  if [[ -d "$srcdir/$_gitname" ]] ; then
    cd "$_gitname"
    git pull origin
    msg "The local files are updated"
  else
    git clone --depth 1 "$_gitroot"
  fi
  
  msg "Starting make"
  
  rm -rf "$srcdir/$_gitname-build"
  cp -a "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  
  cd "$srcdir/$_gitname-build"

  ./configure \
    --disable-shared \
    --enable-debug \
    --enable-static \
    --prefix=/usr \
    --enable-avresample \
    --enable-bzlib \
    --enable-fontconfig \
    --enable-frei0r \
    --enable-gnutls \
    --enable-gpl \
    --enable-libass \
    --enable-libbluray \
    --enable-libcaca \
    --enable-libcelt \
    --enable-libdc1394 \
    --enable-libfaac \
    --enable-libfdk-aac \
    --enable-libfreetype \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libnut \
    --enable-libopencore-amrnb \
    --enable-libopencore-amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-librtmp \
    --enable-libschroedinger \
    --enable-libsoxr \
    --enable-libspeex \
    --enable-libtheora \
    --enable-libtwolame \
    --enable-libutvideo \
    --enable-libv4l2 \
    --enable-libvo-aacenc \
    --enable-libvo-amrwbenc \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libx264 \
    --enable-libxvid \
    --enable-nonfree \
    --enable-openal \
    --enable-openssl \
    --enable-vaapi \
    --enable-vda \
    --enable-vdpau \
    --enable-version3 \
    --enable-x11grab \
    --enable-zlib \

  make
  make tools/qt-faststart
  make doc
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install install-man
  install -D -m755 tools/qt-faststart "$pkgdir/usr/bin/qt-faststart"
  install -D -m644 "$srcdir"/UNREDISTRIBUTABLE.txt "$pkgdir/usr/share/licenses/$pkgname/UNREDISTRIBUTABLE.txt"
  rm -rf "$srcdir/$_gitname-build"
}

# How to audit the ./configure flags:
#
# cut -c 3- <<"# EOF" | sh
# cd src/ffmpeg
# export DISABLED='
# # debugging flags follow:
# --enable-coverage
# --enable-extra-warnings
# --enable-ftrapv
# --enable-memalign-hack
# --enable-memory-poisoning
# --enable-random
# --enable-xmm-clobber-test
# # we do not want this:
# --enable-cross-compile       # not cross building
# --enable-gray                # slow
# --enable-hardcoded-tables    # no advantage
# --enable-lto                 # slow build
# --enable-pic                 # not our job to decide this
# --enable-shared              # handled by options before --prefix
# --enable-small               # we want SPEED instead
# # this stuff does not build:
# --enable-libaacplus          # does not build from AUR
# --enable-libcdio             # cdio/cdda.h missing
# --enable-libflite            # /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/../../../../lib/libflite.a(au_alsa.o): In function `audio_open_alsa': (.text+0x2a): undefined reference to `snd_pcm_hw_params_sizeof'
# --enable-libopencv           # depends itself on ffmpeg, so this is a problem
# --enable-libstagefright-h264 # not in AUR
# --enable-libxavs             # does not build from AUR
# --enable-libilbc             # /tmp/ffconf.ZSFPNrPv.c:1:18: fatal error: ilbc.h: No such file or directory
# # this stuff is not for linux/x86:
# --enable-avisynth            # windows only
# --enable-dxva2               # windows only
# --enable-sram                # not x86
# --enable-thumb               # not x86
# '
# ./configure --help | perl -ne 'for(/--enable-([0-9a-z-]+)\s/) { if($ENV{DISABLED} !~ /^--enable-$_ /m) { print "    --enable-$_ \\\n"; } }' | sort -u
# EOF

# vim:set ts=2 sw=2 et:
