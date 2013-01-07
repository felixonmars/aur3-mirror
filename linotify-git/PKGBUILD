# Contributor: Will Chappell <mr.chapendi@gmail.com>
# Maintainter: Zsolt Udvari <udvzsolt gmail com>
pkgname=linotify-git
pkgver=20130102
pkgrel=1
pkgdesc="lua bindings to inotify"
arch=('i686' 'x86_64')
url="http://github.com/hoelzro/linotify"
license=('GPL')
depends=(lua)
makedepends=('git')
provides=(linotify)
conflicts=(linotify)

_gitroot="git://github.com/hoelzro/linotify.git"
_gitname="linotify"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make || return 1
  install -D -s inotify.so "$startdir"/pkg/usr/lib/lua/5.2/inotify.so
} 
