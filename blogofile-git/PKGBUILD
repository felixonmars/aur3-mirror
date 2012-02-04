# Maintainer: Alex R <ravenxales@gmail.com>
pkgname=blogofile-git
pkgver=20110619
pkgrel=2
pkgdesc="A static website compiler and blog engine, written and extended in Python."
arch=('any')
url="http://blogofile.com/"
license=('MIT')
groups=()
depends=('python')
makedepends=('git' 'python-distribute')
provides=('blogofile=0.8')
conflicts=('blogofile')
replaces=()
backup=()
options=(!emptydirs)
md5sums=()

_gitroot="https://github.com/EnigmaCurry/blogofile.git"
_gitname="plugins"

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

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

}

package() {
  cd "$srcdir/$_gitname-build"
  python setup.py install --root=$pkgdir/ --optimize=1
} 
