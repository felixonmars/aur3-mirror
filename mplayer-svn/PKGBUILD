# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=mplayer-svn
pkgver=37106
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Media player for Linux'
license=('GPL')
url='http://www.mplayerhq.hu/'
backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
depends=(
  'desktop-file-utils' 'ttf-font' 'enca' 'libxss' 'a52dec' 'libvpx'
  'lirc-utils' 'x264' 'libmng' 'libdca' 'aalib' 'lame' 'fontconfig'
  'libgl' 'libxinerama' 'libvdpau' 'libpulse' 'smbclient' 'xvidcore'
  'opencore-amr' 'jack' 'libmad' 'sdl' 'libtheora' 'libcaca' 'libxxf86dga'
  'fribidi' 'libjpeg' 'faac' 'faad2' 'libxvmc' 'schroedinger' 'mpg123'
  'libass' 'libxxf86vm' 'libbluray' 'libcdio-paranoia' 'opus'
)
makedepends=('subversion' 'git' 'yasm')
provides=("mplayer=$pkgver")
conflicts=('mplayer')
install=mplayer.install
options=('!buildflags' '!emptydirs')
source=($pkgname::svn://svn.mplayerhq.hu/mplayer/trunk
        git://git.videolan.org/ffmpeg.git#branch=release/2.2
        mplayer.desktop
        cdio-includes.patch
        include-samba-4.0.patch)
md5sums=('SKIP'
         'SKIP'
         '62f44a58f072b2b1a3c3d3e4976d64b3'
         '7b5be7191aafbea64218dc4916343bbc'
         '868a92bdef148df7f38bfa992b26ce9d')

pkgver() {
  cd $pkgname
  svnversion
}

prepare() {
  cd $pkgname
  mv ../ffmpeg .

  patch -p0 -i ../cdio-includes.patch
  patch -p1 -i ../include-samba-4.0.patch

  ./version.sh
}

build() {
  cd $pkgname

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
    --enable-smb \
    --language=all \
    --confdir=/etc/mplayer
  [[ "$CARCH" = "i686" ]] &&  sed 's|-march=i486|-march=i686|g' -i config.mak

  make
}

package() {
  pkgdesc='Media player for Linux'
  install=mplayer.install
  backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
  depends=(
    'desktop-file-utils' 'ttf-font' 'enca' 'libxss' 'a52dec' 'libvpx'
    'lirc-utils' 'x264' 'libmng' 'libdca' 'aalib' 'lame' 'fontconfig'
    'libgl' 'libxinerama' 'libvdpau' 'libpulse' 'smbclient' 'xvidcore'
    'opencore-amr' 'jack' 'libmad' 'sdl' 'libtheora' 'libcaca' 'libxxf86dga'
    'fribidi' 'libjpeg' 'faac' 'faad2' 'libxvmc' 'schroedinger' 'mpg123'
    'libass' 'libxxf86vm' 'libbluray' 'libcdio-paranoia' 'opus'
  )

  cd $pkgname
  make DESTDIR="$pkgdir" install-mplayer install-mplayer-man

  install -Dm644 etc/{codecs.conf,input.conf,example.conf} \
    "$pkgdir/etc/mplayer/"

  # desktop file (FS#14770)
  install -Dm644 ../mplayer.desktop \
    "$pkgdir"/usr/share/applications/mplayer.desktop
  install -Dm644 etc/mplayer256x256.png \
    "$pkgdir"/usr/share/pixmaps/mplayer.png
}
