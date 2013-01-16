# Maintainer: Federico Cinelli <cinelli.federico@gmail.com>

pkgname=alsa-driver.hda-intel.hda-codec-realtek-git
pkgver=1.0.25
pkgrel=0
pkgdesc="An alternative implementation of Linux sound support"
arch=('any')
conflicts=('alsa-driver')
provides=('alsa-driver')
install='alsa-driver.install'
url="http://www.alsa-project.org"
license=('GPL')
makedepends=('wget' 'make' 'tar' 'linux-headers')
options=('!libtool')

_pkgname=alsa-driver-1.0.25.1463.g87190

build() {
  wget -c http://www.alsa-project.org/snapshot/files/alsa-driver-1.0.25.1463.g87190.tar.bz2
  
  bzip2 -dfv alsa-driver-1.0.25.1463.g87190.tar.bz2 && tar -xvf alsa-driver-1.0.25.1463.g87190.tar
  cd "$srcdir/$_pkgname"

  ./configure
  make -C "$srcdir/$_pkgname" PREFIX=/usr DESTDIR="$srcdir/$_pkgname" install
}
