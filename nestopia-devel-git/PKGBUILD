# Maintainer: hbdee

pkgname=nestopia-devel-git
pkgver=20121220
pkgrel=1
pkgdesc="An NES emulator featuring cycle exact emulation, a ridiculous number of mappers, and lots of custom sound chips - Developer version."
arch=('i686' 'x86_64')
url="http://0ldsk00l.ca/nestopia.html"
license=('GPLv2')
depends=('sdl' 'alsa-lib' 'gtk3' 'glu')
makedepends=('git' 'unzip' 'mesa')
provides=('nestopia')
conflicts=('nestopia')
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/rdanbrook/nestopia.git"
_gitname="nestopia"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname" --branch devel
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  
  sed -i 's;install -m 0644 source/linux/icons/nestopia.svg /usr/share/pixmaps;install -Dm0644 source/linux/icons/nestopia.svg $(PREFIX)/share/pixmaps/nestopia.svg;g' Makefile
  sed -i 's;xdg-desktop-menu install --novendor $(DATADIR)/nestopia.desktop;install -Dm0644 $(DATADIR)/nestopia.desktop $(PREFIX)/share/applications/nestopia.desktop;g' Makefile
  sed -i 's;rm /usr/share/pixmaps/nestopia.svg;rm $(PREFIX)/share/pixmaps/nestopia.svg;g' Makefile
  
  export LDFLAGS=-lX11
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p $pkgdir/usr/{bin,share/nestopia}
  make install PREFIX=$pkgdir/usr
  #make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
