# Maintainer: PyrO_70 <brieuc.roblin at gmail dot com>
pkgname=batterysystemtray-git
pkgver=20130513
pkgrel=1
pkgdesc="A simple battery monitor in the system tray using UPower, in Qt."
arch=('i686' 'x86_64')
url="http://www.pyrotools.org/"
license=('GPL')
depends=('qt4' 'upower')
optdepends=('ucpufreq-git: Chosing governor/frequency per cpu')
makedepends=('git' 'qt4')
replaces=('batterysystemtray-svn')
provides=('ptbatterysystemtray' 'batterysystemtray')
conflicts=('batterysystemtray' 'ptbatterysystemtray')

_gitroot="git://gitorious.org/ptbatterysystemtray/ptbatterysystemtray.git"
_gitname="ptbatterysystemtray"

build() {
  cd "$srcdir"

  msg2 "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    ( cd $_gitname && git pull )
  else
    git clone $_gitroot $_gitname
  fi
  
  cd "$_gitname"

  msg2 "Starting make..."
  qmake-qt4 "INSTALL_PREFIX=/usr"
  make
}

package() {
  cd "$srcdir/$_gitname"
  msg2 "Packing..."
  make "INSTALL_ROOT=$pkgdir" install
}