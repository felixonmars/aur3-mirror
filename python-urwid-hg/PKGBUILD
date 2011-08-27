# maintainer: palbo <palbof@gmail.com>

pkgname=python-urwid-hg
pkgdesc="Urwid is  a curses-based user interface library."
pkgver=154
pkgrel=1
license=('LGPL')
arch=('i686' 'x86_64')
depends=('python>=2.4')
makedepends=('mercurial')
url="http://excess.org/urwid/"
conflicts=(python-urwid)
provides=(python-urwid)
source=()
md5sums=()

_hgroot="https://excess.org/hg"
_hgrepo="urwid"

build() {
  cd $startdir/src

  cp -r $_hgrepo $_hgrepo-build
  cd $_hgrepo-build

  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1

  rm -rf $startdir/src/$_hgrepo-build
}

