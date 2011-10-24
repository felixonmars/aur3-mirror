pkgname=tpnotifier-git
pkgver=20111024
pkgrel=1
pkgdesc="A  text-based pacman notifier for ArchLinux "
arch=('any')
url="http://github.com/cdede/tpnotifier/"
license=('GPL')
depends=('rsync')
makedepends=('git' )

_gitroot="http://github.com/cdede/tpnotifier.git"
_gitname="tpnotifier"

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

  mkdir -p $pkgdir/usr/bin/
  install -Dm 755 tpnoti $pkgdir/usr/bin/
}
