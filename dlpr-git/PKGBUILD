# Maintainer: magnific0
pkgname=dlpr-git
pkgver=20120918
pkgrel=1
pkgdesc="DMENU LPR file printer"
arch=('x86_64' 'i686')
url="https://github.com/magnific0/dlpr.git"
license=('GPL2')
depends=('dmenu' 'cups')
_gitroot="git://github.com/magnific0/dlpr.git"
_gitname="dlpr"

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

  install -Dm755 dlpr "$pkgdir/usr/bin/dlpr"
   
}

# vim:set ts=2 sw=2 et:
