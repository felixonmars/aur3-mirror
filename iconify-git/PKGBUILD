# Contributor: Abazigal <abazigal77@hotmail.com>

pkgname=iconify-git
_realname=iconify
pkgver=20121112
pkgrel=1
pkgdesc="A tool which allow to run any command in a simple GTK interface that can be minimized to an icon in the notification bar"
arch=('i686' 'x86_64')
url="https://github.com/Abazigal/Iconify"
license=('GPL')
depends=('gtk3')
makedepends=('git')

_gitroot="git://github.com/Abazigal/iconify.git"
_gitname="iconify"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin master
    git submodule update
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $srcdir/iconify
  make
  make install PREFIX=$pkgdir/usr

  # Removing .git files
  rm -rf `find $pkgdir/ -type d -name .git`
  
  # Removing build folder
  rm -rf "$srcdir/$_gitname-build"
} 
