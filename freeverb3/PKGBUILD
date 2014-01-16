# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=freeverb3
pkgver=3.1.0
pkgrel=1
pkgdesc="A reverb impulse response processor library including plugins for XMMS, BMP, audacious, and VST."
arch=(i686 x86_64)
url="http://freeverb3.sourceforge.net/"
license=('GPL3')
depends=('fftw' 'jack')
makedepends=('audacious')
optdepends=('audacious: reverb plugins in audacious')
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.xz")
md5sums=('fe4ad4e87401eb0bb635f429198c448f')

prepare() {
  cd $pkgname-$pkgver

  # remove unsecure rpath
  sed -i "s|\(\${wl}\-rpath\)\( \${wl}\$libdir\)|\1-link\2|" configure

  # strip as-needed
  export LDFLAGS="${LDFLAGS/,--as-needed}"

  # strip asm optimization in cpuid() (cause segfaults)
  sed -i '172,182d' freeverb/utils.cpp
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --enable-audacious \
              --enable-release \
              --enable-double \
              --enable-jack \
              --enable-plugdouble \
              --disable-rpath
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
