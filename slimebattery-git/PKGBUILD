# Maintainer: Enrico "Enrix835" Trotta 
#   email:    <enrico.trt@gmail.com>
#   twitter:  @enrix835  

pkgname=slimebattery-git
pkgver=20120507
pkgrel=1
pkgdesc="An extremely lightweight GTK+ battery tray icon written in C"
arch=('i686' 'x86_64')
url="https://github.com/Enrix835/slimebattery"
license=('GPL')
depends=('gtk2' 'acpi')
makedepends=('git')
options=('strip')

_gitroot="git://github.com/Enrix835/slimebattery.git"
_gitname="slimebattery"

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
  
  msg "Starting make..."

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p $pkgdir/usr/bin
  install slimebattery $pkgdir/usr/bin
} 
