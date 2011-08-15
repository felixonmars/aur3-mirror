#Maintainer: Anton Bobrov <bobrov@vl.ru>

pkgname=orcsome-git
pkgver=20110816
pkgrel=1
pkgdesc="A scripting extension for NETWM compliant window managers"
arch=(any)
url="https://github.com/baverman/orcsome"
license=('MIT')
groups=()
depends=('python2' 'python-xlib')
makedepends=('python2-distribute')

_gitroot="git://github.com/baverman/orcsome.git"
_gitname="orcsome"

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

  python2 setup.py install --root=$pkgdir/ --optimize=1
}
