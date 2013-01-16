# Maintainer: TDY <tdy@archlinux.info>

pkgname=ripoff
pkgver=0.8.3
pkgrel=1
pkgdesc="A simple GTK+ CD ripper supporting CDDB lookups and various encoder plugins"
arch=('i686' 'x86_64')
url="http://ripoffc.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'libltdl' 'libcdio' 'libxml2')
optdepends=('flac: for FLAC encoder plugin'
            'lame: for MP3 encoder plugin'
            'libvorbis: for Ogg Vorbis encoder plugin')
options=('!libtool')
source=(http://downloads.sourceforge.net/ripoffc/$pkgname-$pkgver.tar.gz)
md5sums=('96f665293d4483729565cdec745936ae')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  LDFLAGS+="/lib/libX11.so.6 /usr/lib/libdl.so.2" ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
