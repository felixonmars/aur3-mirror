# Maintainer: kang <kang@insecure.ws>
pkgname=mate-note-git
pkgver=20121113
pkgrel=1
pkgdesc="A fork for gnote for MATE."
arch=('x86_64' 'i686')
url="https://github.com/gfunkmonk2/mate-note/"
license=('GPL')
depends=('mate-common' 'hicolor-icon-theme')
makedepends=('git')
replaces=('gnote')

_gitroot=https://github.com/gfunkmonk2/mate-note/
_gitname=master

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
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
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

# vim:set ts=2 sw=2 et:
