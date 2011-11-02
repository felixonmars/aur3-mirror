# Maintainer: (archdria) Adria Arrufat <swiftscythe (at) gmail.com>

pkgname=analitza-git
_realname=analitza
pkgver=20111102
pkgrel=1
pkgdesc="A library lets you add mathematical features to your program. Used in KAlgebra"
arch=('i686' 'x86_64')
url="http://edu.kde.org/kalgebra/"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4' 'git')
provides=(${_realname})
conflicts=(${_realname})
options=(!strip)
md5sums=()

_gitroot="git://anongit.kde.org/${_realname}"
_gitname=${_realname}
 
build() {
  cd ${srcdir}

  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/build
  git clone ${srcdir}/${_gitname} ${srcdir}/build
  cd ${srcdir}/build
 
  cmake . -DCMAKE_BUILD_TYPE=debugfull \
          -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
