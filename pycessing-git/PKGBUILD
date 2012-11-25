# Maintainer: Jon Nordby <jononor@gmail.com>

pkgname=pycessing-git
pkgver=20121120
pkgrel=1
pkgdesc="An easy-to-use Python framework inspired by Processing"
arch=('any')
url="http://pycessing.org"
license=('GPL3')
depends=(python2-pygame python2-pyqt python2-cairo python2-qscintilla)
makedepends=('git')
provides=()
conflicts=()
install=
source=()

_gitroot=https://bitbucket.org/bhowell/pycessing.git
_gitname=pycessing

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
