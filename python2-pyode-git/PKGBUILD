# Contributor: Daniel Strandberg <esodax!nospam!@gmail.com>

_relname=pyode
pkgname=python2-$_relname-git
pkgver=20101020
pkgrel=1
pkgdesc='Bindings for The Open Dynamics Engine'
arch=('i686' 'x86_64')
url='http://pyode.sourceforge.net/'
license=('LGPL2')
depends=('python2' 'ode')
makedepends=('git' 'pyrex')

_gitroot='git://pyode.git.sourceforge.net/gitroot/pyode/pyode'
_gitname='pyode'
_buildir="$srcdir/$_gitname-build"

build() {
  cd $srcdir
  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin || return 1
  else
    git clone $_gitroot || return 1
  fi
  rm -rf $_buildir
  git clone $srcdir/$_gitname $_buildir

  cd $_buildir
  python2 setup.py build || return 1
}

package() {
  cd $_buildir
  python2 setup.py install --root=$pkgdir --prefix=/usr || return 1
}

# vim:ts=2:sw=2:et:
