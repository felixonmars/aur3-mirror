# Contributor: Nezmer <Nezmer@allurelinux.org>
pkgname=orc-git
pkgver=20091227
pkgrel=1
pkgdesc="The Oil Runtime Compiler"
arch=('i686' 'x86_64')
url="http://code.entropywave.com/projects/orc"
license=('custom')
options=('!libtool')
makedepends=('git')
LDFLAGS="${LDFLAGS/-Wl,--as-needed}"

_gitroot="git://code.entropywave.com/git/orc.git"
_gitname="orc"

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
  ./configure --prefix=/usr --disable-static
  make || return 1
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
} 
