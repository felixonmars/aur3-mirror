# Maintainer: Mathias L. Baumann <marenz@supradigital.org>
pkgname=libtu-git
pkgver=20101217
pkgrel=1
pkgdesc="Utility library for notion"
arch=('any')
url="http://notion.sourceforge.net/"
license=('LGPL')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://notion.git.sourceforge.net/gitroot/notion/libtu"
_gitname="libtu"

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

  make
}

package() {
  cd $srcdir/$_gitname-build
  mkdir -p $pkgdir/usr/lib
  cp libtu.a $pkgdir/usr/lib/ || return 1
} 
