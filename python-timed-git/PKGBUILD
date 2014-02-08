# Maintainer: Gregor A. Cieslak <gregor.a.cieslak@gmail.com>
# Contributor: David Gowers <00ai99@gmail.com>
# Contributor: Tom Vincent <http://www.tlvince.com/contact/>

pkgname=python-timed-git
pkgver=20140207
pkgrel=6
pkgdesc="Command-line time tracking tool"
arch=('any')
url="https://github.com/adeel/timed/"
license=('MIT')
depends=('python2' 'python2-termcolor')
makedepends=('git')
conflicts=('python-timed-eugeneoden-git')

_gitroot="git://github.com/adeel/timed.git"
_gitname="timed"

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

  python2 setup.py build || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --prefix=/usr --root=$pkgdir
} 
