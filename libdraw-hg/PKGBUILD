# Contributor: Matthew Bauer <mjbauer95@gmail.com>
_pkgname=libdraw
pkgname=$_pkgname-hg
pkgver=3
pkgrel=1
pkgdesc="libdraw, drawing library from suckless.org"
arch=(i686 x86_64)
url="http://hg.suckless.org/libdraw"
license=('GPL')
groups=()
depends=()
makedepends=('mercurial' 'gcc' 'binutils' 'make' 'sed' 'coreutils')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_hgroot="http://hg.suckless.org/"
_hgrepo="$_pkgname"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    make clean
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/$_hgrepo-build"

  make PREFIX=/usr DESTDIR=$pkgdir install
  
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
