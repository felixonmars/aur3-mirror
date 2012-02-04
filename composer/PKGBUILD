# Maintainer : Thomas Weißschuh <thomas_weissschuh || lavabit.com>

pkgname=composer
pkgver=1.0
pkgrel=1
pkgdesc='Song editor for karaoke game songs'
arch=('i686' 'x86_64')
url="http://performous.org/"
license=('GPL')
depends=('qt' 'ffmpeg')
optdepends=('phonon')
makedepends=('cmake')
source=(http://sourceforge.net/projects/performous/files/editor/$pkgver/Composer-$pkgver-source.tar.bz2)

build() {
  cd ${srcdir}

  rm -rf build
  mkdir -p build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr ..

  make
}

package() {
  cd ${srcdir}/build

  make DESTDIR="$pkgdir" install
}

sha1sums=('8498d460d4cc09ec11780fda935c348b51e7133b')
