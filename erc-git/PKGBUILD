# Contributor: Rodrigo S. Wanderley <rodrigoswanderley@gmail.com>
pkgname=erc-git
pkgver=20080226
pkgrel=1
pkgdesc="ERC: An powerfull IRC client for Emacs"
arch=('i686' 'x86_64')
url="https://savannah.gnu.org/projects/erc/"
makedepends=('git')
depends=('emacs')
license=('GPL')
install=erc.install
conflicts=('erc')
provides=('erc')
source=()
md5sums=()

_gitname="erc.git"
_gitroot="git://git.sv.gnu.org"

build() {
  cd $startdir/src/

  msg "Getting ERC sources through git..."
  if [ -d $startdir/src/$_gitname/.git ] ; then
    cd $_gitname && git-pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot/$_gitname $_gitname
  fi

  cd $startdir/src/$_gitname/
  make lisp || 1

  mkdir -p $startdir/pkg/usr/share/emacs/site-lisp/erc
  cp *.el{,c} $startdir/pkg/usr/share/emacs/site-lisp/erc
}

