# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=shotdetect
pkgver=1.0.86
pkgrel=1
pkgdesc="Shotdetect is a free software (LGPL) which is able to detect shots and scenes in a movie"
arch=('i686' 'x86_64')
url="http://shotdetect.nonutc.fr/"
license=('LGPL')
depends=('ffmpeg-legacy' 'yasm')
source=("http://shotdetect.nonutc.fr/releases/latest.tar.gz")
noextract=()
md5sums=('859b9380febd239247787ef6273f15a2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch ./include/film.h ../../patch-include-film.h 
  patch ./include/image.h ../../patch-include-image.h 
  patch ./src/film.cpp ../../patch-src-film.cpp 

  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
