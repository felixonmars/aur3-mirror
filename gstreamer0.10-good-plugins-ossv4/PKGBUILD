# $Id: PKGBUILD 1180 2008-05-01 19:04:15Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sorin Ionescu <sorin.ionescu@gmail.com>

pkgname=gstreamer0.10-good-plugins-ossv4
pkgver=0.10.18
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Good Plugins (gst-plugins-good) with OSSv4 support"
arch=('i686' 'x86_64')
license=('LGPL')
depends=("gstreamer0.10-good>=${pkgver}" 'libavc1394' 'hal>=0.5.10' 'libiec61883' 'aalib' 'libshout' 'libdv' 'esd' 'libcdio>=0.80' 'flac' 'gconf>=2.22.0' 'wavpack' 'taglib' 'libsoup>=2.4.1')
makedepends=('perlxml' 'pkgconfig')
replaces=('gstreamer0.10-aalib' 'gstreamer0.10-wavpack' 'gstreamer0.10-shout2' 'gstreamer0.10-taglib' 'gstreamer0.10-libcaca' 'gstreamer0.10-libpng' 'gstreamer0.10-jpeg' 'gstreamer0.10-cairo' 'gstreamer0.10-flac' 'gstreamer0.10-speex' 'gstreamer0.10-gdkpixbuf' 'gstreamer0.10-hal' 'gstreamer0.10-dv1394' 'gstreamer0.10-annodex' 'gstreamer0.10-gconf' 'gstreamer0.10-esd' 'gstreamer0.10-cdio' 'gstreamer0.10-dv' 'gstreamer0.10-soup')
conflicts=('gstreamer0.10-aalib' 'gstreamer0.10-wavpack' 'gstreamer0.10-shout2' 'gstreamer0.10-taglib' 'gstreamer0.10-libcaca' 'gstreamer0.10-libpng' 'gstreamer0.10-jpeg' 'gstreamer0.10-cairo' 'gstreamer0.10-flac' 'gstreamer0.10-speex' 'gstreamer0.10-gdkpixbuf' 'gstreamer0.10-hal' 'gstreamer0.10-dv1394' 'gstreamer0.10-annodex' 'gstreamer0.10-gconf' 'gstreamer0.10-esd' 'gstreamer0.10-cdio' 'gstreamer0.10-dv' 'gstreamer0.10-bad-plugins<0.10.7' 'gstreamer0.10-soup' 'gstreamer0.10-good-plugins')
provides=("gstreamer0.10-aalib=${pkgver}" "gstreamer0.10-wavpack=${pkgver}" "gstreamer0.10-shout2=${pkgver}" "gstreamer0.10-taglib=${pkgver}" "gstreamer0.10-libcaca=${pkgver}" "gstreamer0.10-libpng=${pkgver}" "gstreamer0.10-jpeg=${pkgver}" "gstreamer0.10-cairo=${pkgver}" "gstreamer0.10-flac=${pkgver}" "gstreamer0.10-speex=${pkgver}" "gstreamer0.10-gdkpixbuf=${pkgver}" "gstreamer0.10-hal=${pkgver}" "gstreamer0.10-dv1394=${pkgver}" "gstreamer0.10-annodex=${pkgver}" "gstreamer0.10-gconf=${pkgver}" "gstreamer0.10-esd=${pkgver}" "gstreamer0.10-cdio=${pkgver}" "gstreamer0.10-dv=${pkgver}" "gst-plugins-good=${pkgver}" "gstreamer0.10-soup=${pkgver}" "gstreamer0.10-good-plugins=${pkgver}")
url="http://gstreamer.freedesktop.org/"
groups=('gstreamer0.10-plugins')
options=(!libtool)
_relname=gst-plugins-good
source=(${url}/src/${_relname}/${_relname}-${pkgver}.tar.bz2
        http://homepage.ntlworld.com/clive_wright/download/gstreamer-ossv4.tar.gz)

build()
{
  cd $startdir/src/gstreamer-ossv4
  
  oldpath="gst-plugins-good-0.10_6.bak/sys/oss"
  newpath="gst-plugins-good-0.10.6/sys/oss"
  
  sed -e "s:$oldpath/gstossmixer.c:gstossmixer.c~:g" \
      -e "s:$newpath/gstossmixer.c:gstossmixer.c:g" \
      -e "s:$oldpath/gstossmixertrack.c:gstossmixertrack.c~:g" \
      -e "s:$newpath/gstossmixertrack.c:gstossmixertrack.c:g" \
      -e "s:$oldpath/gstossmixertrack.h:gstossmixertrack.h~:g" \
      -e "s:$newpath/gstossmixertrack.h:gstossmixertrack.h:g" \
      -i gst-plugins-good-0.10.6_v0.1.patch  
  
  cd ${startdir}/src/${_relname}-${pkgver}/sys/oss
   
  patch -p0 -i $startdir/src/gstreamer-ossv4/*.patch || return 1

  cd ${startdir}/src/${_relname}-${pkgver}
  
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-experimental \
    --disable-docs-build --disable-plugin-docs \
    --enable-ladspa \
    --with-package-name="GStreamer Good Plugins (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/" || return 1

  make || return 1
  for dir in ext sys/oss sys/ximage; do
    make -C ${dir} DESTDIR=${startdir}/pkg install || return 1
  done
}
md5sums=('9519530e6021698fa1e12a29f16e2feb'
         '085b6f52a81ed06c8aa2a204286efbac')
