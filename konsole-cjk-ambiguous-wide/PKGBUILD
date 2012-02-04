# Maintainer: Jekyll Wu <adaptee [at] gmail [dot] com>

pkgname=konsole-cjk-ambiguous-wide
pkgver=20111017
pkgrel=1
pkgdesc="with experimental feature of displaying CJK characters with ambiguous width as FULLWIDTH."
arch=('i686' 'x86_64')
url='https://bugs.kde.org/show_bug.cgi?id=41744'
license=('LGPL')
depends=('kdebase-runtime>=4.7.2')
makedepends=('cmake' 'git' 'automoc4')
conflicts=('kdebase-konsole')
provides=('kdebase-konsole')
options=(!strip)
install=konsole.install

_gitroot="git://github.com/adaptee/konsole"
_gitname="konsole"
_gitbranch="cjk-ambiguous-wide"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."

  if [[ -d ${srcdir}/${_gitname} ]] ; then
      rm "${srcdir}/${_gitname}" -rf
  fi

  git clone ${_gitroot} ${_gitname}
  cd $_gitname
  git branch ${_gitbranch} origin/${_gitbranch}
  git checkout ${_gitbranch} 

  msg "GIT checkout done"

  msg "Starting make..."
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build
  fi
  mkdir $srcdir/build

  cd $srcdir/build
  cmake  -DCMAKE_BUILD_TYPE=debugfull -DCMAKE_INSTALL_PREFIX=/usr ${srcdir}/$_gitname
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
