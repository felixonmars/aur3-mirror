#Contributor: Kevin Whitaker <eyecreate at gmail dot com>

pkgname=plamsoid-superbar-git
pkgver=20100427
pkgrel=1
pkgdesc="A plasmoid that imitates window 7 bar"
arch=('i686' 'x86_64')
url="http://github.com/jinliu/plasma-superbar-cxx"
depends=('kdebase-workspace>=4.3.0')
makedepends=('cmake' 'automoc4' 'gcc')

license=('GPL')

_gitroot="git://github.com/jinliu/plasma-superbar-cxx.git"
_gitname="plasma-superbar-cxx"

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
 
