# Ethan Schoonover: <es@ethanschoonover.com>
# Original jumanji-git author: mlq <mlq@pwmt.org>
#
# This is a probably temporary AUR package for 
# jumanji-git using the new_webgtk branch.

pkgname=jumanji-new_webgtk-git
pkgver=20110610
pkgrel=1
pkgdesc="a web browser"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/jumanji"
license=('custom')
depends=('gtk3' 'libwebkit3' 'libsoup>=2.30.2' 'libunique3')
makedepends=('git')

conflicts=('jumanji' 'jumanji-git')
replaces=('jumanji' 'jumanji-git')
provides=('jumanji')

_gitroot='git://pwmt.org/jumanji.git'
_gitname='jumanji'
_branchname="-b new_webgtk"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname $_branchname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make

  make DESTDIR="$pkgdir/" install
  install -D -m664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
