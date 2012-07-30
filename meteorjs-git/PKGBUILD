# Maintainer: Ivo Benner <skython[at]web.de>
pkgname=meteorjs-git
pkgver=20120730
pkgrel=1
pkgdesc="Meteor is an open-source platform for building top-quality web apps in a fraction of the time"
arch=('x86_64' 'i686')
url="http://meteor.com/"
license=('MIT')
makedepends=('git')
conflicts=('meteorjs')

_gitroot="git://github.com/meteor/meteor.git"
_gitname="meteor"
_gitbranch="master"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  # Check out branch for easy branch switching
  cd $srcdir/$_gitname
  git checkout $_gitbranch

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  mkdir -p $pkgdir/usr/lib
  PREFIX="$pkgdir/usr" ./install.sh
}

package() {
  # Move meteor to /usr/lib
  mv $pkgdir/usr/meteor $pkgdir/usr/lib/meteor 

  # Fix symlink
  cd $pkgdir/usr/bin
  rm meteor
  ln -s ../lib/meteor/bin/meteor
}

# vim:set ts=2 sw=2 et: