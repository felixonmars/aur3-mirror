# Contributor: Andrej "qwp0" Tokarcik <androsis@gmail.com>

arch=(i686 x86_64)
pkgname=sneakylang-hg
pkgver=20080213
pkgrel=1
pkgdesc="Extensible Wiki language framework"
url="http://projects.almad.net/sneakylang"
license=('LGPL')

conflicts=('sneakylang')
provides=('sneakylang')
source=()
md5sums=()
depends=('python')
makedepends=('mercurial')

_hgtrunk=http://guest:rpgplanet@hg.almad.net/sneakylang
_hgmod=sneakylang

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
