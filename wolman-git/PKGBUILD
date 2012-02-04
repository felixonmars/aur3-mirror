# Contributor: Jakub Luzny <limoto94@gmail.com>
pkgname=wolman-git
pkgver=20080826
pkgrel=1
pkgdesc='Qt4-based Wake-on-LAN manager'
arch=(i686 x86_64)
url='http://www.dolezel.info/projects/wolman'
license=('GPL')
depends=('qt>=4.3.0' 'libpcap' 'libnet' 'iproute')
makedepends=('git')
provides=('wolman')
conflicts=('wolman' 'wolman-svn')
replaces=('wolman-svn')
source=()
md5sums=()

_gitroot="git://dolezel.info/wolman.git"
_gitname="wolman"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d "$srcdir/$_gitname" ] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -r "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  qmake
  make || return 1
  install -Dm 775 wolman "$pkgdir/usr/bin/wolman"
}

#category: network
# vim:set ts=2 sw=2 et:
