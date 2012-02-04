# Maintainer: Shu <shu@shuu.ru>
pkgname=supplement-git
pkgver=20111112
pkgrel=1
pkgdesc="Python completion framework"
arch=('i686' 'x86_64')
url="http://github.com/baverman/supplement"
license=('MIT')
depends=('python2' 'python2-distribute')
makedepends=('python2')

_gitroot="git://github.com/baverman/supplement.git"
_gitname="supplement"

build() {
  cd $srcdir

  msg "Connecting to GIT server..."
  if [[ -d ${_gitname} ]]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone --depth=1 ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${_gitname}-build
  cp -r ${_gitname} ${_gitname}-build

  cd ${srcdir}/${_gitname}-build

  python2 setup.py build
}

package() {
  cd ${srcdir}/${_gitname}-build
  python2 setup.py install --root=$startdir/pkg

  install -D -m664 LICENSE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -rf ${_gitname}-build
}

# vim:set ts=2 sw=2 et:
