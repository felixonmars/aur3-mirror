#Contributor: poplarch <poplarch@gmail.com>
pkgname=fcitx-keyboard-git
pkgver=20120126
pkgrel=1
pkgdesc="X Keyboard Integration wtih Fcitx."
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-keyboard"
license=('GPL')
depends=('fcitx-git')
makedepends=('git' 'cmake' 'intltool')
provides=(fcitx-keyboard)
conflicts=('fcitx-keyboard')
source=()
md5sums=()

_gitroot="git://github.com/fcitx/fcitx-keyboard.git"
_gitname="fcitx-keyboard"

build(){
  cd "$srcdir"
  msg "Connecting to the GIT server...."

  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone $srcdir/$_gitname $srcdir/$_gitname-build
  cd "$srcdir/$_gitname-build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make DESTDIR=${pkgdir} install
}
