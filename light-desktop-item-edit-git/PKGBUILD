# Maintainer: Gerasev Kirill <gerasev.kirill@gmail.com>

pkgname=light-desktop-item-edit-git
pkgver=0.3
pkgrel=3
pkgdesc="Light editor for *.desktop files (shortcuts). Without gnome-panel or xfce dependencies."
arch=(any)
url="https://github.com/gerasev-kirill/light-desktop-item-edit"
license=('LGPL')
depends=('python2-gobject' 'gtk3')
makedepends=('git')
provides=('light-desktop-item-edit')
conflicts=('light-desktop-item-edit')

_gitroot="git://github.com/gerasev-kirill/light-desktop-item-edit.git"
_gitname="light-desktop-item-edit"
_gitbranch="master"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname" --branch "$_gitbranch"
  fi

  msg "Starting build..."
  cd "$srcdir/$_gitname"
  ./configure \
    --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="${pkgdir}" install
}

