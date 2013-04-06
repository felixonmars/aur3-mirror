# Maintainer: enderst <enderst@gmail.com>
# Contributor: enderst <enderst@gmail.com>
pkgname=omptagger
pkgver=1.0.3
pkgrel=3
pkgdesc="Program for modifying and displaying tags for various formats of audio files"
arch=('i686')
url="http://omp.am/omptagger/"
license=('GPL')
depends=('ruby' 'id3lib' 'id3lib-ruby' 'flac' 'vorbis-tools')
source=(http://omp.am/omptagger/files/$pkgname-$pkgver.tar.bz2) 
md5sums=('385905fe9254c42342acfd5bd49e980e') 
build() {
  cd $srcdir
  install -D -m755 omptagger $pkgdir/usr/bin/omptagger
}

# vim:set ts=2 sw=2 et:
