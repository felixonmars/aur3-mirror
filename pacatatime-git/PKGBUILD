pkgname=pacatatime-git
pkgver=20090616
pkgrel=1
pkgdesc="A wrapper on pacman that install few packages at a time. This is good if you have little free space (like I do on my Eee)"
url="http://github.com/boyska/pacatatime/"
arch=('i686' 'x64')
license=('GPL')
depends=('python' 'pacman')
makedepends=('git')
source=()

_gitroot="git://github.com/boyska/pacatatime.git"
_gitname="pacatatime"
_gitbranch="master"


build() {
  msg "Connecting to git.freedesktop.org GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  #git clone $_gitname $_gitname-build
  #cd ${srcdir}/$_gitname-build
  cd ${srcdir}/$_gitname

  git checkout "remotes/origin/$_gitbranch"


  install -D pacatatime.py "$pkgdir/usr/bin/pacatatime"
}
