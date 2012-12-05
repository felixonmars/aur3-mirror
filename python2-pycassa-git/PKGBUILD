# Maintainer: Sebastien Bariteau <numkem@gmail.com>
pkgname=python2-pycassa-git
pkgver=20121205
pkgrel=1
pkgdesc="pycassa is a python client library for Apache Cassandra"
arch=(any)
license=(GPL)
url="https://github.com/pycassa/pycassa"
depends=('python2' 'thrift')
provides=('pycassa')

_gitroot="git://github.com/pycassa/pycassa.git"
_gitname="pycassa"

build() {
  cd "$srcdir"
  msg "Cloning from git...."
  
  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin
    msg "Pulled latest revision from git"
  else
    git clone $_gitroot $_gitname
  fi
  
  msg "Building...."
  # install module in vendor directories.
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
