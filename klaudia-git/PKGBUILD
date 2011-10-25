# Maintainer: falkTX <falktx@gmail.com>

_p=klaudia
pkgname=$_p-git
pkgver=20111025
pkgrel=1
pkgdesc="A multimedia application launcher with LADISH support (Git version)"
arch=(any)
url="http://kxstudio.sf.net/klaudia"
license=('GPL2')
depends=('python2-pyqt' 'dbus-python' 'pyxdg' 'xdg-utils')
makedepends=('git' 'python2-pyqt')
optdepends=('ladish: session support')
provides=("$_p")
conflicts=("$_p")
install="$pkgname.install"

_gitroot="git://repo.or.cz/$_p.git"
_gitname="$_p"

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
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/" install
} 
