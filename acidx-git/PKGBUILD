# Maintainer: demonicmanic <namida1@gmx.net>

pkgname=acidx-git
pkgver=20120504
pkgrel=1
pkgdesc="your Xdefaults on acid"
arch=('x86_64' 'i686')
url="https://github.com/kristopolous/acidx.git"
license=('GPL2')
depends=()
_gitroot="git://github.com/kristopolous/acidx.git"
_gitname="acidx"

build() {
  cd "$srcdir"

  msg "Connecting to the git repository..."
  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  cd "$srcdir"
  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build
 
  make
  
}

package() {
  cd $_gitname-build

  install -Dm755 acidx "$pkgdir/usr/bin/acidx"
  install -Dm755 acidx "$pkgdir/usr/bin/acidxbright"



   
}

# vim:set ts=2 sw=2 et:
