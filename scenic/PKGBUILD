# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=scenic
pkgver=0.6.2
pkgrel=1
pkgdesc="Telepresence-oriented mutimedia broadcasting platform"
arch=('i686' 'x86_64')
url="http://scenic.sat.qc.ca/en/PropulseART"
license=('GPL3')
depends=(libtheora ffmpeg iperf jack qjackctl lame boost twisted vorbis-tools libdc1394 libavc1394 python-portmidi)
[ "$CARCH" == "i686" ] && depends=(libtheora ffmpeg iperf jack-audio-connection-kit qjackctl lame boost twisted vorbis-tools libdc1394 libavc1394 python-portmidi)
makedepends=(help2man)
optdepends=('kernel26rt: strongly recommended to avoid audio echo')
source=(http://scenic.sat.qc.ca/download/${pkgname}-${pkgver}.tar.gz)
md5sums=('fbe31f31864afbace933bbebf075211e')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  find . -name '*.py' -exec sed -i 's/env python/env python2/' {} \;
  export PYTHON=/usr/bin/python2
  ./configure --prefix="/usr" \
              --with-boost-program-options=mt \
              --with-boost-date-time=mt \
              --with-boost-filesystem=mt \
              --with-boost-thread=mt || return 1
  make || return 1
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
