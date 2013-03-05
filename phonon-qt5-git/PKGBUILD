# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=phonon-qt5-git
pkgver=20130304
pkgrel=1
pkgdesc='The multimedia framework for KDE (Qt5 port)'
arch=('i686' 'x86_64')
url='http://phonon.kde.org/'
license=('LGPL')
depends=('qt5-quick1' 'phonon-backend' 'libpulse')
optdepends=('pulseaudio: PulseAudio support')
makedepends=('cmake' 'automoc4' 'pulseaudio' 'git' 'qt5-tools')
provides=('phonon-qt5')

_gitroot='git://anongit.kde.org/phonon.git'
_gitname='phonon'

build() {
    msg "Connecting to the GIT server...."
  
    if [[ -d ${srcdir}/$_gitname ]] ; then
      cd $_gitname
      git pull origin
      msg "The local files are updated."
    else
      git clone $_gitroot $_gitname

      cd $_gitname
      git checkout phonon4qt5
    fi
  
    msg "GIT checkout done"
    msg "Starting make..."
  
    rm -rf ${srcdir}/build && mkdir ${srcdir}/build
    cd ${srcdir}/build
    cmake ../${_gitname} \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_SKIP_RPATH=ON \
      -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd build
    make DESTDIR=${pkgdir} install
}
