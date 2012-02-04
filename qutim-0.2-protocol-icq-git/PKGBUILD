# Contributor: Lex Rivera <x-demon@x-demon.org>
pkgname=qutim-0.2-protocol-icq-git
pkgver=20100205
pkgrel=1
pkgdesc="ICQ protocol for Qutim"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
depends=('qutim')
makedepends=()
optdepends=()
provides=()

_gitroot="git://gitorious.org/qutim/protocols.git"
_gitname="protocols/oscar"

build() {
  msg "Git checkout"
  if [ -d $srcdir/$_gitname ]
  then
  msg "Updating local repository..."
  cd $_gitname
  git pull origin sdk02 || return 1 
  msg "The local files are updated."
  else
  git clone $_gitroot
  cd $_gitname
  git checkout origin/sdk02
  fi
  msg "Git checkout done or server timeout"
  msg "Creating temporary build directory..."
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  msg "Building and installing..."
  qmake || return 1
  make || return 1
  cd $srcdir
  install -Dm 644 $srcdir/protocols/oscar-build/liboscar.so $pkgdir/usr/lib/qutim/liboscar.so || return 1

  msg "Removing build directory..."
  cd ${srcdir}
  rm -Rf ${_gitname}-build
}
