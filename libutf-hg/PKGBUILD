# Maintainer: strake <strake888@gmail.com>
pkgname=libutf-hg
pkgver=20
pkgrel=1
pkgdesc="UTF-8 library, with Plan 9 API"
arch=('i686' 'x86_64')
url="http://hg.suckless.org/libutf"
license=('MIT')
groups=()
depends=()
makedepends=('mercurial')
provides=('libutf')
conflicts=('libutf')
replaces=('libutf')
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_hgroot="http://hg.suckless.org"
_hgrepo=libutf

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  make
}

package() {
  cd "$srcdir/$_hgrepo-build"
  make DESTDIR="$pkgdir/" install
}
