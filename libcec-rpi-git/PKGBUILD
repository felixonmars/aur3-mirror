# Maintainer: mickael9 <mickael9@gmail.com>
# Contributor: Cedric Girard <girard.cedric@gmail.com>

pkgname=libcec-rpi-git
pkgver=20120729
pkgrel=1
pkgdesc="Pulse-Eight's libcec for the Raspberry Pi"
arch=('arm')
url="https://github.com/Pulse-Eight/libcec"
license=('GPL')
makedepends=('git')
depends=('udev>=151' 'lockdev' 'raspberrypi-firmware')
provides=('libcec')
conflicts=('libcec')
options=('!libtool')

_gitroot="https://github.com/Pulse-Eight/libcec.git"
_gitname="libcec"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  autoreconf -vif
  ./configure --prefix="/usr" \
              --enable-rpi \
              --with-rpi-include-path="/opt/vc/include" \
              --with-rpi-lib-path="/opt/vc/lib"
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
