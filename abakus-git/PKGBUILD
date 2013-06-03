# Maintainer: darkapex <me@jailuthra.in>

pkgname=abakus-git
pkgver=20130604
pkgrel=1
pkgdesc="Abakus is a simple calculator for KDE. Think of it as bc (the command-line calculator) with a nice GUI." 
url="https://projects.kde.org/abakus"
depends=('kdebase-runtime' 'qt4')
makedepends=('cmake' 'automoc4' 'flex' 'bison' 'git')
groups=('kdebindings')
conflicts=('abakus')
source=() 
arch=('i686' 'x86_64')
license='GPL2' 
md5sums=('')

_gitroot="git://anongit.kde.org/abakus"
_gitname="abakus"

build() { 
  cd "${srcdir}"
  msg "Connecting to GIT server"
  
  if [ -d $_gitname ]; then
     cd $_gitname && git pull origin
     msg "The local files are updated."
  else
     git clone $_gitroot $_gitname
     cd "${_gitname}"
  fi
  
  if [ ! -d build ]; then 
    mkdir build
  fi
  
  cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
  
  make    
}

package() {
  cd "${_gitname}"/build
  pwd
  make DESTDIR="${pkgdir}" install
}
