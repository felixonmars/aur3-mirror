#Maintainer: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=catch-python-api-git
pkgver=20101104
pkgrel=1
pkgdesc="Python API for catch.com notes"
arch=('any')
url="https://github.com/catch/python-api"
license=('other')
depends=('python2' 'python-simplejson')
makedepends=('git')

_gitroot="git://github.com/catch/python-api.git"
_gitname="python-api"

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
  
  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1

} 
