# Maintainer: Simon Lipp <sloonz@gmail.com>

pkgname=python2-feedparser-git
pkgver=20130304
pkgrel=1
pkgdesc="Parse RSS and Atom feeds in Python [Git version]"
arch=(any)
url="http://www.feedparser.org/"
license=('BSD')
depends=('python2-lxml')
makedepends=('python2-distribute' 'git')
conflicts=('python2-feedparser')
provides=('python2-feedparser')
source=()
md5sums=()

_gitroot="https://code.google.com/p/feedparser/"
_gitname="feedparser"

build() {
  cd "$srcdir"

  if [ -d "$srcdir/$_gitname" ] ; then
      cd "$_gitname"
      git pull || return 1
  else
      git clone "$_gitroot" "$_gitname" || return 1
  fi
  
  cd "$srcdir/$_gitname" &&
  python2 setup.py install -O2 --root="$pkgdir" || return 1
}
