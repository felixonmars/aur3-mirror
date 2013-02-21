# Contributor: Dmitry Shapovalov <dmitry at 0fe dot ru>

pkgname=python-mongoengine-git
pkgver=20130221
pkgrel=1
pkgdesc="A Python Object-Document-Mapper for working with MongoDB, git version"
arch=(any)
url="http://hmarr.com/mongoengine/"
license=('MIT')
depends=('python-pymongo')
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

  python setup.py install --root=$pkgdir || return 1
}
