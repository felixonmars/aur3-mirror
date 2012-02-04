# Contributor: Mychael Janes <mychael.janes@gmail.com>
pkgname=libntlm-git
pkgver=20081120
pkgrel=1
pkgdesc="a library that implement Microsoft's NTLM authentication"
arch=(i686)
source=()
md5sums=()
url="http://josefsson.org/libntlm/"
license=('LGPL')

_gitroot="git://git.savannah.nongnu.org/libntlm.git"
_gitname="libntlm"

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

  rm -r "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # a hack to get a Makefile built
  make

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
