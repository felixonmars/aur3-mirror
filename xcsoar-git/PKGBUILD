# Maintainer: Magnus Olsson <magnus@minimum.se>

pkgname=xcsoar-git
pkgver=20140313
pkgrel=1
pkgdesc="A tactical glide computer."
arch=('any')
url="http://xcsoar.org"
license=('GPL')
groups=()
depends=('sdl_image' 'sdl_ttf' 'sdl' 'curl' 'ttf-dejavu' 'zlib')
makedepends=('librsvg' 'imagemagick' 'libxslt' 'git' 'perl' 'perl-xml-parser' 'mesa' 'boost' 'texlive-bin' 'texlive-core' 'texlive-latexextra' 'perl-locale-po')
provides=()
conflicts=()
replaces=()
backup=()
options=('!buildflags')
install=
source=('dejavu_font_paths.patch')
noextract=()
md5sums=('0182404b867c61217b5ec77311928c35')

_gitroot=git://git.xcsoar.org/xcsoar/master/xcsoar.git
_gitname=xcsoar

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname" 
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  patch -p1 -i $srcdir/dejavu_font_paths.patch
  
  make TARGET=UNIX DEBUG=n V=2
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
