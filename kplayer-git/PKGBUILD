# Contributor: bakthariq <bakthariq-at-gmail-dot-com>

pkgname=kplayer-git
pkgver=20110428
pkgrel=1
pkgdesc="A rich multimedia player that uses the mplayer backend"
arch=("i686" "x86_64")
url="http://kplayer.sourceforge.net"
license=('GPL')
depends=('kdelibs' 'qt' 'mplayer')
makedepends=('pkgconfig' 'git' 'automoc4' 'cmake')
install=kplayer.install
conflict=('kplayer<=0.7')

_gitroot="git://anongit.kde.org/kplayer.git"
_gitname="kplayer"

source=()
md5sums=()

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/build
  mkdir -p ${srcdir}/build
  cd ${srcdir}/build || return 1

  cmake -DCMAKE_INSTALL_PREFIX=$( kde4-config --prefix ) -DCMAKE_BUILD_TYPE=Release ../${_gitname}

  make || return 1
  make DESTDIR=$pkgdir install || return 1

}

