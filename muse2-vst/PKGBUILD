# Contributor: Bernardo Barros <bernardobarros@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=muse2-vst
_realname=muse
pkgver=2.0alpha
pkgrel=1
pkgdesc="A MIDI/Audio sequencer with recording and editing capabilities"
arch=('i686' 'x86_64')
url="http://muse-sequencer.org/"
license=('GPL')
depends=('qt' 'fluidsynth' 'dssi' 'steinberg-vst' 'lash' 'hicolor-icon-theme')
makedepends=('cmake' 'doxygen' 'graphviz')
provides=('muse' 'muse2')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/lmuse/$_realname-$pkgver.tar.gz")
md5sums=('9622b5bbba33add3f0e49a719e924879')

build() {
  # Does not link with as-needed
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"

  cd "$srcdir/$_realname-$pkgver"

  # Python2 Fixes
  sed -i "s_env python_&2_;s_bin/python_&2_" \
    `grep -rlE "(env python|bin/python)" .`

  # Fix desktop category and app name
  sed -i "s_Audio;_&AudioVideo;_;s_use\$_&2_g" \
    packaging/muse.desktop

  # Create build dir
  [[ -d build ]] || mkdir build && cd build

  cmake -DCMAKE_BUILD_TYPE=release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_FLUID=1 \
    -DENABLE_DSSI=1 \
    -DENABLE_LASH=1 \
    -DENABLE_OSC=1 \
    -DENABLE-VST=1 ..
  make
}

package() {
  cd "$srcdir/$_realname-$pkgver/build"
  make DESTDIR="$pkgdir" install
  # Prevent conflicts with Muse qt3
  cd "$pkgdir/usr/share/applications"
  mv muse.desktop $pkgname.desktop
}

