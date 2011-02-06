# $Id: PKGBUILD 72270 2010-03-13 21:57:15Z ibiru $
# Maintainer : Ionut Biru <ionut@archlinux.ro>
# Contributor: Gerson E. Ruotolo ,gersonruotolo@globo.com> 

pkgname=mplayer-libs-system
pkgver=30886
pkgrel=1
pkgdesc="A movie player for linux wiht libs system (ffmpeg and others)"
arch=('i686' 'x86_64')
depends=('a52dec' 'fribidi' 'libxxf86dga' 'ffmpeg' 'libxv' 'libmad' 'giflib' 'cdparanoia' 'libxinerama'
         'sdl' 'lame' 'libtheora' 'xvidcore' 'zlib' 'libmng' 'libxss' 'netembryo-git'
         'libgl' 'smbclient' 'aalib' 'jack' 'libcaca'
         'x264>=20100312' 'faac' 'faad2' 'lirc-utils' 'ttf-dejavu' 'libxvmc' 'libjpeg>=8'
	 'enca' 'libvdpau>=0.4' 'opencore-amr' 'libdca')
license=('GPL')
url="http://www.mplayerhq.hu/"
makedepends=('unzip' 'mesa' 'live-media>=2010.01.13')
backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
source=(ftp://ftp.archlinux.org/other/mplayer/mplayer-${pkgver}.tar.bz2 mplayer.desktop mplayer.png)

## Set to YES to use external ffmpeg (only snapbuild)
sb_ffmpeg=${sb_ffmpeg:-YES}

if [ "${sb_ffmpeg}" = "YES" ] ;then
  sb_ffmpegopts='--disable-libavutil_a  --disable-libavformat_a --disable-libpostproc_a'
fi

# options crashs with tarball 30886
# sb_ffmpegopts: --disable-libswscale_a
# ./configure: --extra-libs="libswscale/rgb2rgb.o" \

build() {
  # Custom CFLAGS break the mplayer build
  unset CFLAGS LDFLAGS

  cd ${srcdir}/mplayer

  ./configure --prefix=/usr \
  	--disable-gui \
	--disable-arts \
	--disable-liblzo \
	--disable-speex \
    --disable-openal \
	--disable-libdv \
	--disable-musepack \
	--disable-esd \
	--disable-mga \
	--disable-dvdread-internal \
    --disable-libdvdcss-internal \
    --disable-tremor-internal \
    --disable-liba52-internal \
    --enable-joystick \
    --enable-smb \
    --with-fribidi-config=pkg-config\ fribidi \
    --disable-nemesi \
    --enable-xvmc \
    --with-xvmclib=XvMCW \
    --enable-fbdev \
    --enable-faad \
    --disable-faad-internal \
    --enable-libcdio \
    --enable-cdparanoia \
	--enable-real \
	--language=all \
    --confdir=/etc/mplayer \
    --disable-runtime-cpudetection \
    --extra-cflags="-fno-strict-aliasing" \
	${sb_ffmpegopts} || return 1

  [ "$CARCH" = "i686" ] &&  sed 's|-march=i486|-march=i686|g' -i config.mak

#  ( cd src/mplayer/libswscale
#  make -C libswscale rgb2rgb.o) || exit 1
  
  make || return 1
  make -j5 DESTDIR=${pkgdir} install || return 1
  install -Dm644 etc/{codecs.conf,input.conf,example.conf} ${pkgdir}/etc/mplayer/ || return 1
  install -dm755 ${pkgdir}/usr/share/mplayer/
  ln -s /usr/share/fonts/TTF/DejaVuSans.ttf ${pkgdir}/usr/share/mplayer/subfont.ttf || return 1
  rm -rf ${pkgdir}/usr/share/mplayer/font
  #desktop file  FS#14770
  install -Dm644 ${srcdir}/mplayer.desktop ${pkgdir}/usr/share/applications/mplayer.desktop || return 1
  install -Dm644 ${srcdir}/mplayer.png ${pkgdir}/usr/share/pixmaps/mplayer.png || return 1
}
md5sums=('ed736419e4efc0e8385d257a38052609'
         'f91b1be03ed301cc15142f49455c1b88'
         'd00874ccc644b7f43d6ef1c942fcef28')
