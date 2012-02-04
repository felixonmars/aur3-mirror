# Contributor: Christoph Siegenthaler <csi@gmx.ch>
pkgname=pimpd-ng-git
pkgver=20100721
pkgrel=1
pkgdesc="Next generation pimpd"
arch=('any')
url="http://github.com/trapd00r/pimpd-ng"
license=('GPLv3')
depends=('perl-audio-mpd')
makedepends=('git')
backup=('etc/pimpd-ng.conf')
source=()
md5sums=() 

_gitroot="git://github.com/trapd00r/pimpd-ng.git"
_gitname="pimpd-ng"

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
  
  mkdir -p $pkgdir/{etc,/usr/bin}
  install pimpd-ng.pl $pkgdir/usr/bin/pimpd-ng
  install pimpd-ng.conf $pkgdir/etc
} 
