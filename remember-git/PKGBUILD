# Contributor: Rodrigo S. Wanderley <rodrigoswanderley@gmail.com>
pkgname=remember-git
pkgver=20080419
pkgrel=2
pkgdesc="Remember: A minimal PIM for Emacs"
arch=('i686' 'x86_64')
url="https://savannah.gnu.org/projects/remember/"
makedepends=('git')
depends=('emacs')
license=('GPL')
install=remember.install
conflicts=('remember')
provides=('remember')
source=()
md5sums=()

_gitname="remember-el.git"
_gitroot="http://repo.or.cz/r"

build() {
  cd $startdir/src/

  msg "Getting Remember sources through git..."
  if [ -d $startdir/src/$_gitname/.git ] ; then
    cd $_gitname && git-pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot/$_gitname $_gitname
  fi

  cd $startdir/src/$_gitname/
  make lisp 2> /dev/null

  mkdir -p $startdir/pkg/usr/share/emacs/site-lisp/remember
  cp *.el{,c} $startdir/pkg/usr/share/emacs/site-lisp/remember
}

