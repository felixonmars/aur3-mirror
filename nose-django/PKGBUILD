# maintainer: palbo <palbof@gmail.com>

pkgname=nose-django
pkgdesc="Plugin for nosetests to run unit tests against Django."
pkgver=13
pkgrel=1
license=('GPL')
arch=('i686' 'x86_64')
depends=('python>=2.5' 'python-nose' 'django')
makedepends=('mercurial')
url="http://bitbucket.org/akaihola/nose-django/"
source=()
md5sums=()

_hgroot="http://bitbucket.org/akaihola/"
_hgrepo="nose-django"

build() {
  cd $startdir/src

  cp -r $_hgrepo $_hgrepo-build
  cd $_hgrepo-build

  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1

  rm -rf $startdir/src/$_hgrepo-build
}

