# Maintainer: Ludovic Fauvet < etix (at) l0cal (dot) com >

pkgname=doxypy-git
pkgver=20100924
pkgrel=1
pkgdesc='Python input filter for Doxygen.'
url='http://github.com/0xCAFEBABE/doxypy'
license='GPL'
arch=('i686' 'x86_64')
depends=('doxygen')
makedepends=('git' 'setuptools')
conflicts=('doxypy' 'doxypy-git')
replaces=('doxypy' 'doxypy-git')
provides=('doxypy')
_gitroot='git://github.com/0xCAFEBABE/doxypy.git'
_gitname='doxypy'
source=()
md5sums=()

build() {
  cd ${srcdir}

  msg "Connecting to GIT server...."

  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"

  if [ -d $_gitname-build ]; then
    msg 'Removing old build directory'
    rm -rf $_gitname-build
  fi

  msg 'Copying repository to another build directory'
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  
  msg "Starting build"
  cd $srcdir/$_gitname-build/src/
  
  msg 'Running setup.py'
  python setup.py build || return 1
  python setup.py install --root=$pkgdir || return 1
}
