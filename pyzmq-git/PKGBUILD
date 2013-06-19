# Contributor: boypt <pentie at gmail.com>
# Maintainer: Daniel YC Lin <dlin.tw at gmail.com>
pkgname=pyzmq-git
pkgver=13.1.0.25.g096ac23
pkgrel=1
pkgdesc="Cython based Python bindings for 0MQ(zeromq)."
arch=(i686 x86_64)
url="http://www.zeromq.org/bindings:python"
license=('LGPL')
depends=(zeromq python2)
makedepends=('git' 'cython2')

_gitroot="http://github.com/zeromq/pyzmq.git"
_gitname="pyzmq"

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g' | sed 's|^v||'
}
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
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  python2 setup.py build||return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
