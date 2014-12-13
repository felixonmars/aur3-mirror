# Maintainer: Marqin <marqin dot pl at google dot com>

_name=vModSynth
_pkgname=vmodsynth
pkgname=vmodsynth-git
pkgver=r32.3f06b6c
pkgrel=1
pkgdesc="vModSynth is a synthesizer that tries to resemble to look&feel of a real, analog, modular synthesizer."
arch=('i686' 'x86_64')
url="http://launchpad.net/vmodsynth/"
license=('GPL3')
depends=('alsa-lib' 'gtkmm3' 'hicolor-icon-theme')
source=("git://github.com/rafalcieslak/vmodsynth.git#branch=master")
md5sums=("SKIP")


pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  aclocal
  autoheader
  automake --add-missing
  autoreconf
  ./configure
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
