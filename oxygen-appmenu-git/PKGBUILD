pkgname=oxygen-appmenu-git
pkgver=20110502
pkgrel=1
pkgdesc="An oxygen style for kwin displaying application menu in titlebar (via menu button)."
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/artwork/oxygen-gtk"
license=('GPL')
depends=('kdebase-workspace>=4.6.0' 'appmenu-qt')
makedepends=('cmake' 'automoc4')
conflicts=('oxygen-appmenu')
provides=('oxygen-appmenu')
source=()
md5sums=()

_gitroot="git://anongit.kde.org/scratch/cedric/oxygen-appmenu.git"
_gitname="oxygen-appmenu"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
    cd ${_gitname}
    cd -
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone -l "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        ../${_gitname}
  make
  make DESTDIR=${pkgdir} install
  rm -rf "${srcdir}/${_gitname}-build"
}
