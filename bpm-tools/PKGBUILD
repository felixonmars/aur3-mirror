# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=bpm-tools
pkgver=0.3
pkgrel=1
pkgdesc="Simple and convenient tool to detect the tempo of music files"
arch=(i686 x86_64)
url="http://www.pogo.org.uk/~mark/bpm-tools/"
license=('GPL')
optdepends=('sox: for audio conversion'
            'gnuplot: for plotting (bpm-graph)'
            'plotutils: for plotting (bpm-graph)'
            'flac: for add bpm tag into flac (bpm-tag)'
            'id3v2: for add bpm tag into mp3 (bpm-tag)'
            'vorbis-tools: for add bpm tag into vorbis (bpm-tag)')
md5sums=('d27f239b9637610154a6192390823eee')
source=("${url}releases/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
