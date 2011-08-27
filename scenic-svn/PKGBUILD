# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=scenic-svn
pkgver=6425
pkgrel=1
pkgdesc="Telepresence-oriented mutimedia broadcasting platform from trunk"
arch=('i686' 'x86_64')
url="http://scenic.sat.qc.ca/en/PropulseART"
license=('GPL3')
depends=(libtheora ffmpeg iperf jack qjackctl lame boost twisted vorbis-tools libdc1394 libavc1394 python-portmidi gstreamer0.10-bad-plugins gstreamer0.10-ffmpeg gstreamer0.10-ugly-plugins)
[ "$CARCH" == "i686" ] && depends=(libtheora ffmpeg iperf jack-audio-connection-kit qjackctl lame boost twisted vorbis-tools libdc1394 libavc1394 python-portmidi gstreamer0.10-bad-plugins gstreamer0.10-ffmpeg gstreamer0.10-ugly-plugins)
makedepends=('help2man' 'svn')
optdepends=('kernel26rt: strongly recommended to avoid audio echo')

_svnmod="scenic"
_svntrunk="http://code.sat.qc.ca/scenic/trunk"

build() {
  cd "$srcdir"

  msg "Downloading from svn repository..."
  svn co ${_svntrunk} ${_svnmod}
  msg "SVN checkout done or server timeout"

  msg "Starting make..."
  cd ${_svnmod}
  find . -name '*.py' -exec sed -i 's/env python/env python2/' {} \;
  export PYTHON=/usr/bin/python2
  ./autogen.sh
  ./configure --prefix="/usr" \
              --with-boost-program-options=mt \
              --with-boost-date-time=mt \
              --with-boost-filesystem=mt \
              --with-boost-thread=mt || return 1
  make || return 1
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
