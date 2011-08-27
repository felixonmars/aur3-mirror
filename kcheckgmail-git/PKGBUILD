# Maintainer: Todd Partridge <todd.partridge@gmail.com>

pkgname=kcheckgmail-git
pkgver=20091208
pkgrel=1
pkgdesc="KDE 4 systray application that notifies when new email is received in a Gmail account"
arch=('i686' 'x86_64')
url="http://kcheckgmail.sourceforge.net/"
license=('GPL')
depends=('kdelibs>=4.1.2' 'qt>=4.5')
makedepends=('gcc' 'cmake' 'automoc4' 'git' 'gettext')
md5sums=()

_gitroot="git://git.debian.org/users/lpereira-guest/kcheckgmail.git"
_gitname="kcheckgmail-kde4"

build(){

  cd $srcdir

  msg "Connecting to $_gitroot..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
    msg2 "Local files updates"
  else
    git clone $_gitroot $_gitname
    cd $_gitname
    git checkout -b kde4-port origin/kde4-port
    msg2 "Git checkout done"
  fi

  install -d build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
  DCMAKE_BUILD_TYPE=debugfull ..
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
