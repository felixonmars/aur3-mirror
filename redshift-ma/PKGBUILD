# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Based on the `redshift-git` package

pkgname=redshift-ma
pkgver=1.9.r178.g26660bf
pkgrel=1
pkgdesc="Adjusts the color temperature of your screen according to your surroundings (maandree's development branch)"
arch=('i686' 'x86_64')
url='https://github.com/maandree/redshift'
license=('GPL3')
depends=('libxcb' 'libxxf86vm' 'libdrm' 'geoclue')
provides=('redshift')
conflicts=('redshift')
optdepends=('gtk3: for redshift-gtk'
            'python-xdg: for redshift-gtk'
            'python-gobject: for redshift-gtk'
            'librsvg: for redshift-gtk' # needs to be clarified
            'hicolor-icon-theme: for redshift-gtk')
makedepends=('git' 'python') # python needed for redshift-gtk
install=$pkgname.install
source=(redshift::"git+https://github.com/maandree/redshift.git#branch=ma")
md5sums=('SKIP')

pkgver() {
  cd redshift
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g' | sed -e 's:^1\.8:1\.9:g'
}

build() {
  cd redshift
  ./bootstrap
  env CFLAGS="-Og -g ${CFLAGS}" \
      ./configure               \
          --prefix=/usr         \
          --enable-{geoclue,gui,randr,vidmode,drm,fakegdi,wingdi,fakequartz,quartz}
  make
}

package() {
  cd redshift
  make DESTDIR="$pkgdir" install
}

