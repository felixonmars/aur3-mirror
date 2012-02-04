# Contributor: Henri Häkkinen  <henuxd@gmail.com>

pkgname=wordgen-git
pkgver=20090523
pkgrel=1
pkgdesc="Wordlist generator."
arch=('i686' 'x86_64')
url="http://henux.nor.fi/projects/wordgen.php"
license=('GPL')
depends=('glibc')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://github.com/henux/wordgen.git"
_gitname="wordgen"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git-pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
