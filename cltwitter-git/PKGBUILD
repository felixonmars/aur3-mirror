# Contributor: Martin Häger <martin.haeger@gmail.com> 
pkgname=cltwitter-git
pkgver=20100214
pkgrel=1
pkgdesc="Command-line utility for posting updates to Twitter, written in C."
arch=('i686' 'x86_64')
url="http://mtah.github.com/cltwitter"
license=('GPL')
depends=('curl' 'libxml2' 'pcre' 'liboauth')
makedepends=('git')
provides=()
conflicts=()
options=()
source=()
md5sums=()

_gitroot="git://github.com/mtah/cltwitter.git"
_gitname="cltwitter"

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

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
