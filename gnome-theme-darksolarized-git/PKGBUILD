# Maintainer: Neil Perry <nperry@gmail.com>
pkgname=gnome-theme-darksolarized-git
pkgver=20130423
pkgrel=2
pkgdesc="DarkSolarized Theme"
url=('https://github.com/NPerry/gnome-theme-darksolarized')
arch=('any')
license=('GPL')
depends=('gtk2-xfce-engine' )
makedepends=('git')
source=()
md5sums=()

_gitroot=git://github.com/NPerry/gnome-theme-darksolarized.git
_gitname=gnome-theme-darksolarized

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
}

package() {
  _destdir=$pkgdir/usr/share/themes/DarkSolarized

  cd "$srcdir/$_gitname"

  mkdir -p $_destdir

  #Make sure anyone can write
  find . -type d -exec chmod 755 '{}' \;

  msg "Installing files..."
  cp -r *  $_destdir
}
