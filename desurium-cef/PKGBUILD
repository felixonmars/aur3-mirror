# Maintainer : prettyvanilla <prettyvanilla@lavabit.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Matthias "matthiaskrgr" Krüger
# Contributor: Jookia <166291@gmail.com>

_pkgname=Desurium
pkgname=desurium-cef
pkgver=0.8.0_rc10
pkgrel=2
pkgdesc="Chromium Embedded Framework, runtime dependency for Desurium."
arch=('i686' 'x86_64')
url="http://github.com/lodle/Desurium"
license=('BSD')
depends=('alsa-lib' 'libevent' 'libxslt' 'nss' 'gtk2' 'xdg-utils' 'flac' 'speex')
makedepends=('cmake' 'python' 'yasm' 'gperf')
source=("https://github.com/desura/Desurium/archive/$pkgver.tar.gz")
md5sums=('f1bde8b11e88787304d91d62b8a1de86')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i 's|downloads/lodle|downloads/desura|' CMakeLists.txt
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  if [ -d build_cef ]; then
    rm -r build_cef
  fi

  mkdir build_cef && cd build_cef

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DRUNTIME_LIBDIR=/usr/lib/ \
        -DBUILD_ONLY_CEF=ON \
        -DH264_SUPPORT=ON ..

  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/build_cef"
  make DESTDIR="$pkgdir/" install
}
