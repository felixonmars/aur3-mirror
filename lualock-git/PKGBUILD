# Maintainer: Guff <cassmacguff@gmail.com>
pkgname=lualock-git
pkgver=20110729
pkgrel=1
pkgdesc="A screenlocker that's highly configurable in lua"
arch=('i686' 'x86_64')
url="https://github.com/Guff/lualock"
license=('GPL3')
depends=('libxss' 'gtk3' 'lua' 'pam' 'lua-oocairo-git' 'lua-oopango-git')
makedepends=('git')
provides=('lualock')
conflicts=('lualock')
source=()
md5sums=()

_gitroot="git://github.com/Guff/lualock.git"
_gitname="lualock"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    git checkout 
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  
  cd "$srcdir/$_gitname-build"

  make PREFIX=/usr
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
