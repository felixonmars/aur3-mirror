# Maintainer: Sandro Munda <munda.sandro@gmail.com>

pkgname=python2-dnspython-git
pkgver=20121004
pkgrel=1
pkgdesc="A DNS toolkit for python"
arch=('any')
url="http://www.dnspython.org"
license=('BSD')
depends=('python2')
makedepends=('git')
md5sums=()

_gitroot="git://www.dnspython.org/dnspython.git"
_gitname="python2-dnspython"

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
  cd "$srcdir/$_gitname-build/"

  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root=$pkgdir/
}
