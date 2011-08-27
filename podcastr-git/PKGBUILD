# Created by Richard Shaw <drowned.flame@gmail.com>
pkgname=podcastr-git
pkgver=20100729
pkgrel=1
pkgdesc="A Python podcast updater"
arch=('any')
url="http://github.com/openinja/podcastr"
license=('custom:MIT')
depends=('python' 'python-urljr' 'python-feedparser')
makedepends=('git')
backup=()
source=()
md5sums=() 

_gitroot="git://github.com/openinja/podcastr.git"
_gitname="podcastr"

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
  
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m755 podcastr $pkgdir/usr/bin
  install LICENSE $pkgdir/usr/share/licenses/$pkgname
  # For next version.
  # install podcastr.conf $pkgdir/etc
} 
