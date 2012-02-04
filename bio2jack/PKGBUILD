# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>

pkgname=bio2jack
pkgver=0.9
pkgrel=2
pkgdesc="A library for porting blocked io (bio) OSS/ALSA audio applications to Jack"
arch=('i686' 'x86_64')
url="http://bio2jack.sourceforge.net/"
license=('GPL')
depends=('jack-audio-connection-kit' 'libsamplerate')
makedepends=('pkgconfig>=0.9.0')
options=('!libtool')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('00b64a99856cb35f1170c97ecb6bc431')

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh && ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
