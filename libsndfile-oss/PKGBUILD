# Maintainer syne <madlikene[at]aim.com>
pkgname=libsndfile-oss
pkgver=1.0.25
pkgrel=1
license=('GPL')
options=(!libtool)
pkgdesc="a C library for reading and writing files containing sampled sound without ALSA dependence"
arch=(i686 x86_64)
url="http://www.mega-nerd.com/libsndfile"
depends=('flac>=1.1.4')
source=(http://www.mega-nerd.com/libsndfile/files/libsndfile-$pkgver.tar.gz)
provides=("libsndfile=$pkgver")
conflicts=('libsndfile')
md5sums=('e2b7bb637e01022c7d20f95f9c3990a2')

package() {
  cd $startdir/src/libsndfile-$pkgver

  ./configure --prefix=/usr --disable-sqlite --disable-alsa
  make || return 1
  make DESTDIR=$startdir/pkg install
}

