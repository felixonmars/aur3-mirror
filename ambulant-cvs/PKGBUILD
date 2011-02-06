# Contributor:Xemertix <arch88(at)katamail(dot)com>

pkgname=ambulant-cvs
pkgver=20100420
pkgrel=1
pkgdesc="A program to play SMIL (Synchronized Multimedia Integration Language) files"
url="http://www.ambulantplayer.org/"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('gettext' 'cvs')
depends=('expat' 'ffmpeg'  'sdl' 'libxml2' 'gtk2')
optdepends=('live-media' 'xerces-c-2' 'arts' 'xulrunner' 'faad2' 'gstreamer0.10')
provides=('ambulant')
conflicts=('ambulant')
source=('ambulant.png' 'ambulant.desktop')
md5sums=('6eaef631585cf405d550de798cb8443e'
         '29782fa992bbc91f20f1cf9e13f8677a')

_cvsroot=":pserver:anonymous:@ambulant.cvs.sourceforge.net:/cvsroot/ambulant"
_cvsmod="ambulant"

build() {
  cd ${srcdir}

  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi
  ./autogen.sh

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  cp -r ../$_cvsmod ../$_cvsmod-build
  cd ../$_cvsmod-build

  ./configure --prefix=/usr \
  --with-xerces --with-xerces-plugin --with-ffmpeg --with-gtk --without-qt \
  --with-gstreamer --with-smil-test --enable-fast-install || return 1
  CFLAGS="-fPIC"
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  rm -r ${srcdir}/$_cvsmod-build

  install -D -m644 ${srcdir}/ambulant.png ${pkgdir}/usr/share/pixmaps/ambulant.png || return 1
  install -D -m644 ${srcdir}/ambulant.desktop ${pkgdir}/usr/share/applications/ambulant.desktop || return 1

}

#--with-live=/usr/lib/live-media  --with-expat 
