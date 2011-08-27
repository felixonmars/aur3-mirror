# Maintainer: Yahya Mohajer <yaya_2013 {AT} yahoo {DoT} com>

pkgname=mplayer-fribidi-pulse
pkgver=32492
pkgrel=1
pkgdesc="A movie player for linux with fribidi and PulseAudio support"
arch=('i686' 'x86_64')
depends=('libxxf86dga' 'libmad' 'cdparanoia' 'libxinerama' 'sdl' 'lame' 'libtheora' 'xvidcore' 'libmng' 'libxss'
        'libxv' 'giflib' 'zlib' 'libjpeg>=8' 'fribidi' 'libgl' 'smbclient' 'aalib' 'jack' 'libcaca' 'x264' 'faac'
	'lirc-utils' 'ttf-dejavu' 'libxvmc' 'enca' 'libvdpau>=0.4' 'opencore-amr' 'libdca' 'a52dec'
	'schroedinger' 'libvpx' 'pulseaudio')
makedepends=('unzip' 'mesa' 'live-media>=2010.01.13' 'yasm')
conflicts=('mplayer')
provides=("mplayer=${pkgver}")
license=('GPL')
url="http://www.mplayerhq.hu/"
makedepends=('unzip' 'mesa' 'live-media>=2010.01.13')
backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
source=(ftp://ftp.archlinux.org/other/mplayer/mplayer-${pkgver}.tar.xz mplayer.desktop mplayer.png)
md5sums=('01beb068608d3977fbb84b0b28935cee'
         'f91b1be03ed301cc15142f49455c1b88'
         'd00874ccc644b7f43d6ef1c942fcef28')

build() {
  # Custom CFLAGS break the mplayer build
  unset CFLAGS LDFLAGS

  cd ${srcdir}/mplayer

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
	--enable-xvmc \
	--language=all \
  --confdir=/etc/mplayer \
	--enable-pulse \
	--extra-cflags="-fno-strict-aliasing" || return 1

  [ "$CARCH" = "i686" ] &&  sed 's|-march=i486|-march=i686|g' -i config.mak

  make || return 1
  make -j1 DESTDIR=${pkgdir} install || return 1
  install -Dm644 etc/{codecs.conf,input.conf,example.conf} ${pkgdir}/etc/mplayer/ || return 1
  install -dm755 ${pkgdir}/usr/share/mplayer/
  ln -s /usr/share/fonts/TTF/DejaVuSans.ttf ${pkgdir}/usr/share/mplayer/subfont.ttf || return 1
  rm -rf ${pkgdir}/usr/share/mplayer/font
  #desktop file  FS#14770
  install -Dm644 ${srcdir}/mplayer.desktop ${pkgdir}/usr/share/applications/mplayer.desktop || return 1
  install -Dm644 ${srcdir}/mplayer.png ${pkgdir}/usr/share/pixmaps/mplayer.png || return 1
}
