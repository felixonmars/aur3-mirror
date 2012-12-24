# Maintainer: Jesús Roldán <jesus.roldan@gmail.com.com>
pkgname=python-pacmanprogressbar
pkgver=0.3.2
pkgrel=1
pkgdesc="Progressbar for Python, based on pacman ArchLinux progressbar"
arch=('any')
url="https://github.com/xeBuz/pacman-progressbar"
license=('BSD')
depends=('python')
makedepends=('git')

_gitroot="git://github.com/xeBuz/pacman-progressbar.git"
_gitname="pacman-progressbar"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1 || return 1
}

