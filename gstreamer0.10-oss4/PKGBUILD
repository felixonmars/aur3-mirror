# Contributor: Benjamin Richter <br@waldteufel-online.net>
# with parts taken from 
#   extra/gstreamer0.10-bad
#   by Jan de Groot <jgc@archlinux.org>

pkgname='gstreamer0.10-oss4'
pkgver=0.10.18
pkgrel=2
pkgdesc="GStreamer Multimedia Framework OSSv4 Plugin (from gst-plugins-bad)"
arch=(i686 x86_64)
license=('LGPL' 'GPL')
makedepends=('pkgconfig' 'gstreamer0.10-base>=0.10.28' 'bzip2')
depends=('gstreamer0.10-base>=0.10.28' 'oss')
conflicts=('gstreamer0.10-bad-plugins')
url="http://gstreamer.freedesktop.org/"
options=(!libtool !emptydirs)
source=(${url}src/gst-plugins-bad/gst-plugins-bad-${pkgver}.tar.bz2)
md5sums=('84838893b447e774d401a698ff812b32')

build() {
  cd "${srcdir}/gst-plugins-bad-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static \
    --with-package-name="GStreamer OSSv4 Plugin (Archlinux User Repository)" \
    --with-package-origin="http://aur.archlinux.org/" --without-plugins \
    --disable-{directsound,directdraw,osx_video,quicktime,vcd,alsa,assrender} \
    --disable-{amrwb,apexsink,bz2,cdaudio,celt,cog,dc1394,directfb,dirac,dts} \
    --disable-{divx,dvdnav,metadata,faac,faad,fbdev,gsm,jack,jp2k} \
    --disable-{kate,ladspa,lv2,libmms,modplug,mimic,mpeg2enc,mplex,musepack} \
    --disable-{musicbrainz,mythtv,nas,neon,ofa,rsvg,timidity,wildmidi,sdl} \
    --disable-{sdltest,sndfile,soundtouch,spc,gme,swfdec,theoradec,xvid} \
    --disable-{dvb,wininet,acm,vdpau,schro,zbar} --enable-oss4 

  make -C sys/oss4 || return 1
}

package() {
  cd "${srcdir}/gst-plugins-bad-${pkgver}"
  make -C sys/oss4 DESTDIR="${pkgdir}" install || return 1
}
