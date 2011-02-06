# Maintainer: Michal Kowalski <kowalski TOD michal TA gmail TOD com>

_pkgname=drfe

pkgname=drfe-git
pkgver=20110124
pkgrel=1
pkgdesc="dereferencier is a CLI \"snippets\" DB and perhaps even a GTD app"
arch=('i686')
url="https://github.com/ypb/drfe"
license=('GPL3')
groups=('ypb')
depends=('tdb')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
md5sums=()
noextract=()
#generate with 'makepkg -g'

_gitroot="git://github.com/ypb/drfe.git"
_gitname=${_pkgname}
_prefix="/usr"

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

  # BUILD HERE

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" prefix=${_prefix} install
} 
