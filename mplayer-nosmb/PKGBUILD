# Maintainer: Samuel Creshal <samuel@creshal.de>
# Contributor:  Ionut Biru <ibiru@archlinux.org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgbase='mplayer'
pkgname='mplayer-nosmb'
pkgver=37051
pkgrel=1
pkgdesc="A movie player for linux (without samba support)."
arch=('i686' 'x86_64')
makedepends=(
  'libxxf86dga' 'libxxf86vm' 'libmad' 'libxinerama' 'sdl' 'lame' 'libtheora'
  'xvidcore' 'libmng' 'libxss' 'libgl' 'aalib' 'jack' 'libcaca'
  'x264' 'faac' 'faad2' 'lirc-utils'  'libxvmc' 'enca' 'libvdpau' 'opencore-amr'
  'libdca' 'a52dec' 'schroedinger' 'libvpx' 'libpulse' 'fribidi' 'unzip' 'mesa'
  'live-media' 'yasm' 'git' 'fontconfig' 'mpg123' 'ladspa' 'libass' 'libbluray'
  'libcdio-paranoia' 'opus'
)
install=mplayer.install
backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
depends=(
  'desktop-file-utils' 'ttf-font' 'enca' 'libxss' 'a52dec' 'libvpx'
  'lirc-utils' 'x264' 'libmng' 'libdca' 'aalib' 'lame' 'fontconfig'
  'libgl' 'libxinerama' 'libvdpau' 'libpulse' 'xvidcore'
  'opencore-amr' 'jack' 'libmad' 'sdl' 'libtheora' 'libcaca' 'libxxf86dga'
  'fribidi' 'libjpeg' 'faac' 'faad2' 'libxvmc' 'schroedinger' 'mpg123'
  'libass' 'libxxf86vm' 'libbluray' 'libcdio-paranoia' 'opus'
)
conflicts=('mplayer')
provides=("mplayer=$pkgver")
license=('GPL')
url='http://www.mplayerhq.hu/'
options=('!buildflags' '!emptydirs')
source=($pkgbase-$pkgver::svn://svn.mplayerhq.hu/mplayer/trunk#revision=$pkgver
        http://ffmpeg.org/releases/ffmpeg-2.2.tar.bz2
        mplayer.desktop
        cdio-includes.patch)
md5sums=('SKIP'
         '744febca199548c9393b1f1ed05ccdd8'
         '62f44a58f072b2b1a3c3d3e4976d64b3'
         '7b5be7191aafbea64218dc4916343bbc')

prepare() {
  cd $pkgbase-$pkgver
  mv ../ffmpeg-2.2 ./ffmpeg

  patch -p0 -i ../cdio-includes.patch

  ./version.sh
}

build() {
  cd $pkgbase-$pkgver

  ./configure --prefix=/usr \
    --enable-runtime-cpudetection \
    --disable-gui \
    --disable-arts \
    --disable-liblzo \
    --disable-speex \
    --disable-openal \
    --disable-libdv \
    --disable-musepack \
    --disable-esd \
    --disable-mga \
    --disable-ass-internal \
    --disable-cdparanoia \
    --enable-xvmc \
    --enable-radio \
    --enable-radio-capture \
    --disable-smb \
    --language=all \
    --confdir=/etc/mplayer
  [[ "$CARCH" = "i686" ]] &&  sed 's|-march=i486|-march=i686|g' -i config.mak

  make
}

package() {

  cd $pkgbase-$pkgver
  make DESTDIR="$pkgdir" install-mplayer install-mplayer-man

  install -Dm644 etc/{codecs.conf,input.conf,example.conf} \
    "$pkgdir/etc/mplayer/"

  # desktop file (FS#14770)
  install -Dm644 ../mplayer.desktop \
    "$pkgdir"/usr/share/applications/mplayer.desktop
  install -Dm644 etc/mplayer256x256.png \
    "$pkgdir"/usr/share/pixmaps/mplayer.png
}

