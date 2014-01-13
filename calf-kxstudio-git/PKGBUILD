# Maintainer : speps <speps at aur dot archlinux dot org>

pkgname=calf-kxstudio-git
pkgver=0.0.19.r1364.4c5fec5
pkgrel=1
pkgdesc='LV2/DSSI/LADSPA plug-ins suite and standalone JACK host (FalkTX fork)'
arch=('x86_64' 'i686')
url='http://calf.sf.net/'
license=('LGPL')
depends=('fftw' 'lash' 'fluidsynth' 'desktop-file-utils')
makedepends=('lv2' 'ladspa' 'dssi')
provides=("calf=$pkgver" "calf-kxstudio=$pkgver")
conflicts=('calf')
source=("$pkgname::git+https://github.com/falkTX/calf.git")
install="$pkgname.install"
options=('!libtool')
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  echo $(awk -F '[][]' '/AC_INIT/{print $4}' configure.ac).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr \
              --enable-experimental \
              --enable-sse
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
