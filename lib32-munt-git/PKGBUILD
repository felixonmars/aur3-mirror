# Mantainer: Franco Tortoriello

pkgname=lib32-munt-git
pkgdesc="Software synthesiser emulating pre-GM MIDI devices, such as the Roland MT-32 (lib32)"
pkgver=1.2.0_55
pkgrel=1
arch=(i686 x86_64)
url="http://munt.sourceforge.net"
license=(LGPL2.1)
depends=(munt-git)
makedepends=(git cmake)
source=(git+https://github.com/munt/munt.git)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/munt"
  git describe --always |cut -d- -f1,2 |sed -e 's/munt_//g' -e 's/_/./g' -e 's/-/_/g'
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "$srcdir/munt/mt32emu"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  install -Dm644 "$srcdir/munt/mt32emu/libmt32emu.a" \
	"$pkgdir/usr/lib32/libmt32emu.a"
}

