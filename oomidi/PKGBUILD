# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=oom
pkgname=oomidi
pkgver=2011.3.1
pkgrel=1
pkgdesc="Open Octave Midi, the open source MIDI/Audio sequencer."
arch=(i686 x86_64)
url="http://www.openoctave.org/"
license=('GPL')
depends=('qt' 'liblo' 'lash' 'fluidsynth' 'liblscp' "suil<1.0.0" "lilv<1.0.0")
makedepends=('cmake' 'dssi')
conflicts=("$pkgname-git" "oom")
replaces=("$_pkg")
install="$pkgname.install"
source=("https://github.com/ccherrett/oom/wiki/$_pkg-$pkgver.tar.gz")
md5sums=('fd39c3b7ce071cb98847ce35e470ed37')

build() {
  cd "$srcdir/$_pkg-$pkgver"

  # prepare build folder
  [[ -d build ]] || mkdir build && cd build

  cmake .. -DCMAKE_BUILD_TYPE=release \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DENABLE_LASH=ON \
           -DENABLE_OSC=ON \
           -DENABLE_DSSI=ON \
           -DENABLE_FLUID=ON \
           -DENABLE_LSCP=ON
  make
}

package() {
  cd "$srcdir/$_pkg-$pkgver/build"

  make DESTDIR="$pkgdir/" install

  # prevent conflicts with muse 2
  cd "$pkgdir/usr/bin" && mv grepmidi oom-grepmidi

  # python2 fixes
  sed -i "s|bin/python|&2|;s|env python|&2|" \
    `grep -Erl "(bin/python|env python)" "$pkgdir"`
} 
