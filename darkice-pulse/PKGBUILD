# Maintainer: Emeric Grange <emeric.grange@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Ganjolinux aka Basalari David <ganjolinux@gmail.com>

pkgname=darkice-pulse
pkgver=1.0
pkgrel=1
pkgdesc="Live audio streamer. Records audio from an audio interface, encodes it and sends it to a streaming server"
arch=('i686' 'x86_64')
url="http://code.google.com/p/darkice/"
license=('GPL')
backup=('etc/darkice.cfg')
depends=('gcc-libs' 'alsa-lib' 'lame' 'libvorbis' 'faac' 'jack' 'pulseaudio' 'automake1.10')
optdepends=('icecast: To use Icecast streaming server' 'shoutcast: To use Nullsoft SHOUTcast streaming server')
provides=('darkice=1.0')
source=("http://darkice.googlecode.com/files/darkice-${pkgver}.tar.gz"
	'darkiced'
	'pulseaudio_2.patch')
md5sums=('1804e63d42a9703d01fe378c9a77c473'
         'a2608524120e6bb1c704ed4c9165a386'
         'a67edb2904271511edcc155e45cd0488')

build() {
  cd ${srcdir}/darkice-${pkgver}
  patch -Np0 -i ../../pulseaudio_2.patch
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --without-aacplus \
    --without-twolame \
    --with-pulseaudio
  make
}

package() {
  cd ${srcdir}/darkice-${pkgver}
  make DESTDIR=${pkgdir} install

  install -Dm755 ${srcdir}/darkiced ${pkgdir}/etc/rc.d/darkice
}
