# Maintainer: Ethan Zonca <ethanzonca@ethanzonca.com>

pkgname=qtledtest
pkgver=20140102
pkgrel=1
pkgdesc="QT tool to evaluate different OLED displays and GUI layouts"
arch=("any")
license=("LGPL")
url="http://sroz.net/projects/qtledtest"
depends=("qt4")
makedepends=("git" "qt4")

_gitroot='https://github.com/jnwatts/QtLedTest.git/'
_gitname='QtLedTest.git'

build() {

  msg 'Connecting to GIT server...'
  if [[ -d ${_gitname} ]]
  then
      cd ${_gitname}
      git reset --hard HEAD
      git pull -f
      git clean -f
  else
      git clone ${_gitroot} ${_gitname}
  fi

  msg 'GIT checkout complete'

  cd ${srcdir}/${_gitname}
  git submodule init
  git submodule update
  cd QLedMatrix
  qmake-qt4 && make
  cd ../
  qmake-qt4 && make
}

package() {
  cd ${srcdir}/${_gitname}
  mkdir ${pkgdir}/usr
  mkdir ${pkgdir}/usr/lib
  mkdir ${pkgdir}/usr/bin

  cp QLedMatrix/build/libqledmatrix.so ${pkgdir}/usr/lib
  cp QtLedTest ${pkgdir}/usr/bin
}

