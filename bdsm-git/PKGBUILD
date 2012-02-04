# Maintainer: Joseph Hsu <jhsu.x1@gmail.com>
pkgname=bdsm-git
pkgver=20110418
pkgrel=1
pkgdesc="BDSM Framework :: Bash Devops Scripting Management Framework"
arch=('i686' 'x86_64')
url="https://bdsm.beginrescueend.com/"
license=("Apache License, Version 2.0")
depends=("bash")
makedepends=("git")
provides=("bdsm")
source=()
md5sums=()

_gitroot=https://github.com/wayneeseguin/bdsm.git
_gitname=bdsm

build() {
  cd "$srcdir"
  msg "Connecting to Github repo ($_gitroot)...."
  if [ -d $_gitname ] ; then
    cd $_gitname
    git pull || return 1
    msg2 "The local files are updated."
  else
    msg2 "Cloning repo..."
    git clone $_gitroot $_gitname
  fi
}

package() {
  msg2 "Installing BDSM..."
  cd "$srcdir/$_gitname"
  export prefix_path=$pkgdir
  ./install
}

# vim:set ts=2 sw=2 et:
