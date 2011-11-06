# Maintainer: feuri <feurisoft@gmail.com>

pkgname=neticon-git
pkgver=20111106
pkgrel=1
pkgdesc="A utility to display your current network status in the tray"
arch=(i686 x86_64)
url="https://github.com/feuri/NetIcon"
license=('GPL3')
depends=('glib2' 'gtk3' 'gksu' 'netcfg')
makedepends=('git' 'vala')
install=

_gitroot="git://github.com/feuri/NetIcon.git"
_gitname="NetIcon"

build()
{
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

  make
}

package()
{
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
