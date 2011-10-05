# Contributor: Daniel Strandberg <esodax!nospam!@gmail.com>

pkgname=wto-git
pkgver=20111005
pkgrel=1
pkgdesc="web tv orange sans firefox et enregistreur en python"
arch=('any')
url="http://wto.tuxfamily.org/downloads"
license=('GPL')
depends=( 'python>=2.6' 'pygtk' 'mplayer')
makedepends=('git' )
provides=('wto')
conflicts=('wto')
install=

_gitroot="git://git.tuxfamily.org/gitroot/wto/wto.git"
_gitname="wto"

build() {
  cd $srcdir

  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin || return 1
  else
    git clone $_gitroot || return 1
  fi
  rm -rf $srcdir/$_gitname-build
  git clone $srcdir/$_gitname $srcdir/$_gitname-build

  cd $srcdir/$_gitname-build

python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1

}

package() {
cd $startdir/pkg/usr/bin

}

# vim:ts=2:sw=2:et:
