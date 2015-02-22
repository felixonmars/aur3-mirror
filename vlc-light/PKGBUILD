# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Zsolt Udvari <udvzsolt gmail com>
# Based on vlc-mini by anrxc

basename=vlc
pkgname=vlc-light
pkgver=2.1.5
pkgrel=3
pkgdesc="An MPEG, VCD, DVD and DivX player, lightweight version."
arch=("i686" "x86_64")
url="http://www.videolan.org/vlc/"
license=('LGPL2.1' 'GPL2')
depends=("libmad" "ffmpeg" "sysfsutils" "qt4"
         "libxml2" "a52dec" "x264"
         "libmpeg2" "libxcb")
provides=("vlc")
conflicts=("vlc")
options=("!libtool")
install="${pkgname}.install"
source=("http://download.videolan.org/pub/videolan/${basename}/${pkgver}/${basename}-${pkgver}.tar.xz"
        "vlc-2.0.7-vaapi-compat.patch"
        "vlc-2.1.5-ffmpeg-2.4.patch"
        "vlc-2.1.5-avformat-initialize-probe-data-fixes-11851.patch")
md5sums=('3941b561f590cc95ca5e795213cba2f2'
         '6df10774bb7acf20e09d6139e5c7839e'
         '068a1b792064bb1aff0765a3ffa8a27a'
         '787a854f3acde37cd6e76a8fa8e6f1d0')

prepare() {
  cd "${srcdir}/${basename}-${pkgver}"

  patch -p1 -i "../vlc-2.0.7-vaapi-compat.patch"
  patch -p1 -i "../vlc-2.1.5-ffmpeg-2.4.patch"
  patch -p1 -i "../vlc-2.1.5-avformat-initialize-probe-data-fixes-11851.patch"
  autoreconf -fi

  sed -i -e 's:truetype/freefont:TTF:g' modules/text_renderer/freetype.c
  sed -i -e 's:truetype/ttf-dejavu:TTF:g' modules/visualization/projectm.cpp
}

build() {
  cd "${srcdir}/${basename}-${pkgver}"


  rm -rf ../build
  mkdir "../build"
  cd ../build

  CFLAGS+=" -I/usr/include/samba-4.0" CPPFLAGS+=" -I/usr/include/samba-4.0" \
  ../${basename}-${pkgver}/configure --prefix=/usr \
              --enable-{alsa,avcodec,avformat,a52,fontconfig,freetype,glx} \
              --enable-{libxml2,libmpeg2,loader,mad} \
              --enable-{optimize-memory,optimizations,qt4,sout} \
              --enable-{vlc,xvideo,xcb,x264} \
              --disable-{aa,atmo,bluray,bonjour,caca,coverage,cprof} \
              --disable-{dbus,dbus-control,dca,dc1394,debug,decklink,dirac,directfb,directx,dshow,dv,faad,fbosd,flac,fluidsynth,fribidi} \
              --disable-{gme,gnomevfs,gnutls,goom,gprof,growl,httpd,jack,kate} \
              --disable-{libcddb,libgcrypt,libproxy,libtar,linsys,lirc,live555,lua} \
              --disable-{macosx,macosx-audio,mod,mpc,mtp,nls,notify,oss} \
              --disable-{portaudio,projectm,pulse,pvr,quicktime,real,realrtsp,rpath,run-as-root} \
              --disable-{schroedinger,sdl,sdl-image,sftp,shine,shout,sid,skins2,smb,speex,sqlite,svg,switcher} \
              --disable-{taglib,telepathy,telx,theora,tiger,tremor,twolame} \
              --disable-{udev,upnp,update-check,vcd,vcdx,visual,vlm,vorbis,v4l2} \
              --disable-{waveout,wingdi,wma-fixed,xosd,zvbi} \
              RCC=/usr/bin/rcc-qt4
  make
}

package() {
  cd ${srcdir}/${basename}-${pkgver}/../build
  make DESTDIR="${pkgdir}" install

# Install icons
  for res in 16 32 48 128; do
    install -D -m644 ${srcdir}/${basename}-${pkgver/.a}/share/icons/${res}x${res}/vlc.png \
        "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/vlc.png"
  done
}
