# Maintainer: Santiago Piccinini <gringotumadre at gmail dot com>
pkgname=clam
pkgver=1.4.0
pkgrel=4
pkgdesc="C++ Library for Audio and Music"
arch=('i686' 'x86_64')
url="http://clam-project.org"
license=('GPL')
depends=('fftw' 'libxml++' 'id3lib' 'ladspa' 'libmad' 'libogg' 'libvorbis' 'libxi' 'libsndfile' 'portaudio' 'jack')
makedepends=('scons' )
source=(http://clam-project.org/download/src/CLAM-$pkgver.tar.gz
        clam-gcc_fixes.diff)
md5sums=('614bb957a7aeecc667e144a46a1b87d2'
         '6c91eb8e9707e431e9a1ed10057cfa60')

build() {
  install -d $pkgdir/usr
  cd "$srcdir/CLAM-$pkgver"
  
  patch -uNp1 -i ../clam-gcc_fixes.diff

  scons configure verbose=1 release=1 xmlbackend='xmlpp' prefix=/usr prefix_for_packaging=$pkgdir/usr
  scons
}

package() {
  cd "$srcdir/CLAM-$pkgver"
  scons install
}
