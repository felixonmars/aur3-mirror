# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Jekyll Wu <adaptee at gmail dot com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Marek Kubica <marek@xivilization.net>

pkgname=phonon-gstreamer-git
pkgver=3153.4ab7c4e
pkgrel=1
pkgdesc="GStreamer backend for phonon, the multimedia API of KDE."
arch=("i686" "x86_64")
url="https://projects.kde.org/projects/kdesupport/phonon/phonon-gstreamer"
license=("LGPL")
depends=("phonon" "gstreamer0.10")
makedepends=("pkg-config" "cmake" "automoc4" "git")
provides=('phonon-gstreamer' 'phonon-backend')
conflicts=('phonon-gstreamer')
install="phonon-gstreamer.install"
source=("phonon-gstreamer::git://anongit.kde.org/phonon-gstreamer")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/phonon-gstreamer"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/phonon-gstreamer"
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}


package () {
  cd "$srcdir/phonon-gstreamer"
  make DESTDIR="$pkgdir" install
}

