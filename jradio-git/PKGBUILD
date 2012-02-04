# Author: Johannes Marbach <jm@rapidrabbit.de>
pkgname=jradio-git
pkgver=20111127
pkgrel=1
pkgdesc="An easy to use web radio player"
arch=('i686 x86_64')
url="https://github.com/Johennes/jRadio"
license=('BSD')
depends=(gtkmm3 vlc libxml2 curl)
makedepends=('git')

_gitroot=git://github.com/Johennes/jRadio.git
_gitname=git

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

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

  #
  # BUILD HERE
  #
  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  install -D -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname
}

post_install() {
  gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
}

post_upgrade() {
  gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
}

post_remove() {
  gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
}