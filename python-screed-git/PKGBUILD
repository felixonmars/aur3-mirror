# Contributor: Yerko Escalona <yescalona[at]ug[dot]uchile[dot]cl>

pkgname=python-screed-git
pkgver=20101121
pkgrel=1
pkgdesc="Indexing and retrieving lots of (biological) sequences, quickly"
arch=('any')
license=('BSD')
depends=('python2')
makedepends=('git')
url="http://github.com/acr/screed"

_gitroot="git://github.com/acr/screed.git"
_gitname="screed"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."
  
  rm -rf $srcdir/$_gitname-build
  git clone $srcdir/$_gitname $srcdir/$_gitname-build
  
  cd $srcdir/$_gitname-build
  python2 setup.py install --root=$pkgdir/ --optimize=1
}