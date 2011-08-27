# Maintainer: polslinux <garrett16@hotmail.it> 

pkgname=brainspell-git
_pkgname=brainspell
pkgver=20101215
pkgrel=2
pkgdesc="logical game for programmers: write on Brainfuck for speed!"
url="https://github.com/darvin/brainspell"
license=('GPL')
arch=('any')
depends=('python2' 'pyqt' 'phonon')
makedepends=('git' 'python2-distribute')
conflicts=('brainspell')
replaces=('brainspell')
provides=('brainspell=0.9')
options=('!libtool')
_gitroot='git://github.com/darvin/brainspell.git'
_gitname='brainspell'
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
  python setup.py build
  python setup.py install --prefix=/usr --root=$pkgdir
}
