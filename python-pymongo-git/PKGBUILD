# Contributor: totoloco <totoloco at ushcompu dot com dot ar>

pkgname=python-pymongo-git
pkgver=20100805
pkgrel=1
pkgdesc="Python driver for MongoDB"
license=("APACHE")
url="http://pypi.python.org/pypi/pymongo/"
depends=('python')
makedepends=('setuptools')
arch=('any')
provides=('python-pymongo')
conflicts=('python-pymongo')
replaces=('python-pymongo')

_gitroot="http://github.com/mongodb/mongo-python-driver.git"
_gitname="mongo-python-driver"

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
  cp -R "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python setup.py install --root=$pkgdir
}
