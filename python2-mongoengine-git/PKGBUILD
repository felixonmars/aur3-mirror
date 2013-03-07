# Contributor: Vladimir Cerny <blackvladimir at gmail dot com>

pkgname=python2-mongoengine-git
pkgver=20130307
pkgrel=1
pkgdesc="A Python Object-Document-Mapper for working with MongoDB, git version"
arch=(any)
url="http://mongoengine.org"
license=('MIT')
conflicts=(python2-mongoengine)
depends=('python2-pymongo')
makedepends=('setuptools' 'git')
options=(!emptydirs)

_gitroot="https://github.com/MongoEngine/mongoengine.git"
_gitname="mongoengine"

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

  python2 setup.py install --root=$pkgdir || return 1
}
