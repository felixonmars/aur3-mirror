# Contributor: Jesus Lazaro Plaza <jesuslazaro84@gmail.com>

pkgname=smilutils-cvs
pkgver=20080612
pkgrel=1
pkgdesc="Collection of command line tools for SMIL (Kino's projects file format) manipulation"
arch=('i686' 'x86_64')
url="http://www.kinodv.org/"
license=('GPL')
depends=('libglade' 'libdv' 'libsamplerate' 'libxv' 'ffmpeg' 'libiec61883' 'libavc1394' 'libsm' 'libquicktime')
makedepends=('sed' 'cvs' 'automake' 'autoconf')
provides=('smilutils')

source=()
md5sums=()

_files2patch="libkino/avi.cc libkino/filehandler.cc libkino/frame.cc libkino/playlist.cc \
     extensions/PixbufUtils.cc extensions/DVEncoder.cc extensions/PPMPump.cc \
     apps/image2raw/image2raw.cc apps/ppm2raw/ppm2raw.cc apps/raw2dv/raw2dv.cc \
     apps/raw2image/raw2image.cc apps/raw2webcam/raw2webcam.cc apps/raw2yuv/raw2yuv.cc \
     apps/rawmultiply/rawmultiply.cc apps/smil2raw/smil2raw.cc apps/smil2yuv/smil2yuv.cc \
     apps/smil2wav/smil2wav.cc apps/ppmfilter/ppmfilter.cc apps/ppm2webcam/ppm2webcam.cc"
_cvsmod="smilutils"
_cvsroot=":pserver:anonymous:@kino.cvs.sourceforge.net:/cvsroot/kino"

build() {
  cd ${startdir}/src
  msg "Connecting to kino.cvs.sourceforge.net CVS server..."
  cvs -z3 -d ${_cvsroot} co -D ${pkgver} -f ${_cvsmod}
  cd ${_cvsmod}
  sed -i '1i\#include <cstring>' ${_files2patch}
	
  msg "Starting build process..."
  ./autogen.sh
  ./configure --prefix=/usr --mandir=/usr/man
  make DESTDIR=${startdir}/pkg install
}
