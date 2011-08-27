#Contributor: sxe <sxxe@gmx.de>

pkgname=kwin-effect-scaleout-git
_realname=kwin-effect-scaleout
pkgver=20100414
pkgrel=1
pkgdesc="A KWin effect to smoothly maximize/restore windows."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Scale+Up?content=123208"
depends=('kdebase-workspace>=4.3.0')
makedepends=('cmake' 'automoc4' 'gcc')

license=('GPL')

_gitroot="git://github.com/jinliu/kwin-effect-scaleout.git"
_gitname="kwin-effect-scaleout"

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
