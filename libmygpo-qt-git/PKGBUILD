# Packager: Samir Faci <csgeek@archlinux.us> 

pkgname=libmygpo-qt-git
pkgver=20110517
pkgrel=1
pkgdesc="libmygpo-qt is a Qt Library that wraps the gpodder.net Web API" 
arch=('i686'  'x86_64')
url="https://github.com/gpodder/libmygpo-qt/"
license=('LGPLv3')
groups=()
depends=('qt' 'cmake' 'pkg-config' 'qjson' )
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()

_gitroot='https://github.com/gpodder/libmygpo-qt.git'
_gitname='libmygpo-qt'
_buildir=${_gitname}-build


build() 
{

  cd ${srcdir}

  msg 'Connecting to GIT server...'

  if [ -d ${_gitname} ]; then
     cd ${_gitname} && git pull origin
     cd ..
  else
     git clone ${_gitroot}
  fi

  msg 'GIT checkout done or server timeout.'

  if [ -d ${_buildir} ]; then
     msg 'Cleaning previous build...'
     rm -rf ${_buildir}
  fi

  git clone ${_gitname} ${_buildir}

  cd ${_buildir}
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
  make
}

package() {
  cd "$srcdir/$_buildir/build"

  make  install
}

