# Contributor: Christopher Rogers <slaxemulator@gmail.com>
pkgname=meiga-git
pkgver=20090625
pkgrel=1
pkgdesc="Meiga is lightweight, easy to use, network friendly and also application friendly."
arch=(i686 x86_64)
url="http://meiga.igalia.com/"
license=('GPL')
depends=('gnome-common' 'apache' 'libsoup' 'gtk2' 'gupnp>=0.6')
makedepends=('vala>=0.7.2' 'git')

_gitroot="http://git.igalia.com/meiga.git"
_gitname="meiga"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
