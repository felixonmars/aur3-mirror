# Maintainer: Mathieu Pasquet <mathieui@mathieui.net>
# Contributor: Mathieu Pasquet <mathieui@mathieui.net>
pkgname=python-dnspython-git
pkgver=20101108
pkgrel=1
pkgdesc="A DNS toolkit for python"
arch=('any')
url="http://www.dnspython.org"
license=('BSD')
depends=('python')
makedepends=('git')
md5sums=() #generate with 'makepkg -g'

_gitroot="git://www.dnspython.org/dnspython.git"
_gitname="python-dnspython"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname -b python3
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/"

  python setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"
  python setup.py install --root=$pkgdir/
}
