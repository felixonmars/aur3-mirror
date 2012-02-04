# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=ktechlab-zoltan_p-git
pkgver=20110815
pkgrel=1
pkgdesc="IDE for electronic circuits and microcontrollers. KDE4 git version"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ktechlab"
license=("GPL")
depends=('kdebase-runtime' 'kdevplatform' 'gpsim')
makedepends=('cmake' 'git')
provides=('ktechlab')
conflicts=('ktechlab')
install=ktechlab.install

_gitroot=git://ktechlab.git.sourceforge.net/gitroot/ktechlab/ktl-zoltan_p
_gitname=ktl-zoltan_p

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  cd "${srcdir}"

  msg "Starting source code configuration..."
  mkdir -p build && cd build
  cmake "${srcdir}/${_gitname}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`

  msg "Starting make..."
  make
}

#check() {
#  cd "${srcdir}/build"
#  make -k test
#}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}/" install
}
