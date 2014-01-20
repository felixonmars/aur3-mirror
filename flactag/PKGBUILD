# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Steven Allen <steven@stebalien.com>

pkgname=flactag
pkgver=2.0.4
pkgrel=1
pkgdesc="Utility for tagging single album FLAC files with embedded CUE sheets using data from the MusicBrainz service"
arch=('x86_64' 'i686')
url="http://flactag.sourceforge.net/"
license=('GPL3')
depends=('libmusicbrainz5' 'libdiscid' 'flac' 'slang' 'gnutls' 'unac' 'libjpeg' 'asciidoc')
source=("http://downloads.sourceforge.net/sourceforge/flactag/$pkgname-$pkgver.tar.gz")
md5sums=('c66e110c52d4672aa1f979edfdad2fc7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  LIBS="-lFLAC" ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
