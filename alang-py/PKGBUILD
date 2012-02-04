pkgname=alang-py
pkgver=20110711
pkgrel=1
pkgdesc="Simple locale library for Python"
arch=('i686' 'x86_64')
url="http://osworld.pl"
license=('GPL')
depends=('python')
makedepends=('git')
provides=('alang-py')
conflicts=('alang-py')

_gitroot="git://github.com/webnull/alang-py.git"
_gitname="alang-py"

build() {
  cd "$srcdir"

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
 # cd "$srcdir/$_gitname-build"
 # ./install.sh
  cp "$srcdir/alang-py/usr" "$srcdir/../pkg/usr" -R
}
