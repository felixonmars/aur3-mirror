# Contributor: Tom Wambold <tom5760@gmail.com
pkgname=pywc-git
pkgver=20091006
pkgrel=1
pkgdesc="Static python website generator."
arch=('any')
url="http://github.com/tom5760/pywc"
license=('GPL')
depends=('python' 'docutils' 'python-jinja')
makedepends=('git')
provides=('pywc')

_gitroot="git://github.com/tom5760/pywc.git"
_gitname="pywc"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  python setup.py install --root="$pkgdir/" || return 1
} 
