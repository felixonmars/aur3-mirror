# Maintainer: Richard Schwab <mail NOSPAM w.tf-w.tf>
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>
pkgname=phonon-vlc-git
pkgver=0.5.0_156.g3951930
pkgrel=1
epoch=1
pkgdesc="Phonon VLC backend, git version"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/kdesupport/phonon/phonon-vlc"
license=('LGPL')
depends=('phonon-git' 'vlc' 'qt4')
makedepends=('git' 'automoc4' 'cmake' 'phonon')
provides=('phonon-vlc' 'phonon-backend')
conflicts=('phonon-vlc')
options=('!strip')
source=("git://anongit.kde.org/phonon-vlc")
md5sums=('SKIP')

pkgver() {
  cd phonon-vlc
  git describe --tags --always | sed 's|^v||; s|-|_|; s|-|.|g'
}

build() {
  cd phonon-vlc

  cmake -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
        -DCMAKE_BUILD_TYPE=debugfull \
        -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
        .
  make
} 

package () {
  cd phonon-vlc
  make DESTDIR="$pkgdir" install
}
