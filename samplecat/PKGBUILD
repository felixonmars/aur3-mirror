# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

# host does not accept default curl User Agent (workaround)
DLAGENTS[1]+=' -A "Mozilla/4.0"'

pkgname=samplecat
pkgver=0.2.3
pkgrel=1
pkgdesc="A program for cataloguing and auditioning audio samples"
arch=('i686' 'x86_64')
url="http://samplecat.orford.org/"
license=('GPL2')
depends=('dbus-glib' 'ffmpeg' 'fftw' 'gtk2' 'jack' 'libmysqlclient' 'sqlite3')
options=('!libtool' '!emptydirs')
source=("http://www.orford.org/assets/$pkgname-$pkgver.tar.gz")
md5sums=('c9f9d474ed32c0be4cf3c0e589280336')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # remove deprecated avcodec
  sed -i '/avcodec_init/d' src/audio_decoder/ad_ffmpeg.c

  LDFLAGS+=' -lgmodule-2.0' \
  ./configure --prefix=/usr \
              --enable-sqlite \
              --enable-ayyi
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
