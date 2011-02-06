# Maintainer: qwp0 <androsis@gmail.com>

arch=(i686 x86_64)
pkgname=czechtile-hg
pkgver=20080213
pkgrel=1
pkgdesc="Simple wiki syntax suitable for czech/slovak keyboard layouts"
url="http://projects.almad.net/czechtile"
license=('LGPL')

conflicts=('czechtile')
provides=('czechtile')
source=()
md5sums=()
depends=('python' 'sneakylang')
makedepends=('mercurial')

_hgtrunk=http://guest:rpgplanet@hg.almad.net/python-czechtile
_hgmod=czechtile

build() {
  cd $startdir/src

  if [ -d $_hgmod/.hg ]; then
    (cd $_hgmod && hg pull -v && hg update)
  else
    hg clone $_hgtrunk $_hgmod
  fi

  msg "hg clone done or server timeout"
  msg "Starting 'python setup.py install'..."

  cp -r $_hgmod $_hgmod-build
  cd $_hgmod-build

  python ./setup.py install --root=$startdir/pkg || return 1
  rm -rf $startdir/src/$_svnmod-build
}
