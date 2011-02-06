# Maintainer: agvares <agvares13@gmail.com>

pkgname=vala_cmake-git
pkgver=20100922
pkgrel=1
pkgdesc="Vala support modules for CMake"
arch=('i686' 'x86_64')
url="http://github.com/jakobwesthoff/Vala_CMake"
license=('GPL')
depends=('cmake>=2.8.0')
makedepends=('git')

_gitroot="http://github.com/jakobwesthoff/Vala_CMake.git"
_gitname="Vala_CMake"

build() {
  cd "$srcdir"
  msg "Connecting to server...."
  if [ -d $_gitname/.git ]; then
    cd $_gitname
    git pull
  else
    git clone $_gitroot
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Install CMake modules..."
  
  cd "$srcdir/${_gitname}"

  install -D -m644 vala/FindVala.cmake $pkgdir/usr/share/cmake-2.8/Modules/FindVala.cmake
  install -D -m644 vala/ParseArguments.cmake $pkgdir/usr/share/cmake-2.8/Modules/ParseArguments.cmake
  install -D -m644 vala/ValaPrecompile.cmake $pkgdir/usr/share/cmake-2.8/Modules/ValaPrecompile.cmake
  install -D -m644 vala/ValaVersion.cmake $pkgdir/usr/share/cmake-2.8/Modules/ValaVersion.cmake
}
