# Maintainer: (archdria) Adria Arrufat <swiftscythe (at) gmail.com>

pkgname=kdeedu-cantor-git
_realname=cantor
pkgver=20110611
pkgrel=1
pkgdesc="KDE Frontend to Mathematical Software"
arch=('i686' 'x86_64')
url="http://edu.kde.org/kalgebra/"
license=('GPL')
depends=('kdebase-runtime')
optdepends=("kdeedu-kalgebra: KAlgebra backend"
            "maxima: Maxima backend"
            "octave: Octave backend"
            "r: R backend"
            "scilab: SciLab backend")
makedepends=('cmake' 'automoc4' 'git' 'docbook-xsl' 'libkdeedu-git')
provides=(${_realname})
conflicts=(${_realname})
#options=(!strip)
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
 
  cmake . -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
