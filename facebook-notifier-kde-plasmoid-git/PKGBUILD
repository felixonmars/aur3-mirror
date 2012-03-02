# Maintainer: vicky91 <vickypaiers@gmail.com>
pkgname=facebook-notifier-kde-plasmoid-git
pkgver=20120302
pkgrel=1
pkgdesc="A KDE plasmoid that shows your facebook notifications fetched from the notifications feed URL provided to the plasmoid."
arch=('i686' 'x86_64')
url="https://github.com/viranch/facebook-notifier-kde-plasmoid"
license=('GPL2')
depends=('kdebase-workspace')
makedepends=('git')

install=

_gitroot=https://github.com/viranch/facebook-notifier-kde-plasmoid.git
_gitname=facebook-notifier-kde-plasmoid

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

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make

}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
