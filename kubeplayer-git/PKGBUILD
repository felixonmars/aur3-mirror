# Maintainer: Jakub Kozisek <nodevel at gmail dot com>

pkgname=kubeplayer-git
pkgver=20110902
pkgrel=2
pkgdesc="A multimedia player for different online platforms."
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/multimedia/kubeplayer"
license=('GPLv3')
depends=('ruby>=1.9.0' 'phonon' 'kdebindings-korundum' 'kdebindings-smokegen')
makedepends=('ruby>=1.9.0' 'git' 'cmake')
conflicts=('kubeplayer')
replaces=('kubeplayer')

_gitroot="git://anongit.kde.org/kubeplayer.git"
_gitname="kubeplayer"

source=()
md5sums=()

build() {
  cd ${srcdir}
  msg "Connecting to GIT server..."

  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cmake -DCMAKE_INSTALL_PREFIX=$( kde4-config --prefix ) -DCMAKE_BUILD_TYPE=Release ./${_gitname}
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
