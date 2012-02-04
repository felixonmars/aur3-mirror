#Contributor: Bruno Galeotti <bravox87 at gmail dot com>
pkgname=twitty-twister-git
pkgver=20101123
pkgrel=1
pkgdesc='A twisted client for twitter-like APIs.'
url='http://github.com/dustin/twitty-twister'
license='custom'
arch=('i686' 'x86_64')
depends=()
makedepends=('git')
conflicts=('twitty-twister' 'twitty-twister-git')
replaces=('twitty-twister' 'twitty-twister-git')
provides=('twitty-twister')
_gitroot='git://github.com/dustin/twitty-twister.git'
_gitname='twitty-twister'
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
  cd $srcdir/$_gitname-build
  
  msg 'Running setup.py'
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir || return 1
}