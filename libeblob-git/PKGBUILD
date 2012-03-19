pkgname=libeblob-git
pkgrel=1
pkgver=20120319
pkgdesc="A new DHT implementation from the author of the in-kernel distributed filesystem POHMELFS"
arch=('i686' 'x86_64')
url="http://ioremap.net/projects/libeblob"
license=('GPL')
provide=('libeblob')
conflicts=('libeblob')
makedepends=('make' 'gcc' 'git' 'autoconf' 'automake')
optdepends=('fcgi' 'tokyotyrant' 'libatomic' 'db')

_gitroot=http://www.ioremap.net/git/eblob.git
_gitname=eblob.ġit

build() {
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"
  export LDFLAGS="${LDFLAGS//,--as-needed}"
  export LDFLAGS="${LDFLAGS//--as-needed}"

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh
  PYTHON_VERSION=2 ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
