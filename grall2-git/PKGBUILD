# Contributor: Nikhilesh S <s.nikhilesh@gmail.com>
pkgname=grall2-git
pkgver=20111205
pkgrel=1
pkgdesc="A 3D action/puzzle game (currently still in development but playable)."
arch=('i686' 'x86_64')
url="http://www.nikhilesh.info/grall2.html"
license=('GPL')
depends=('boost-libs' 'bullet' 'mygui' 'ogre' 'ogreal-svn'
'ois' 'python')
makedepends=('git' 'premake3' 'boost')
provides=('grall2')
conflicts=('grall2')

_gitroot="git://github.com/nikki93/grall2.git"
_gitname="grall2"

build() {
  ## GIT
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  ## BUILD
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  premake --target gnu --data_prefix "/usr/share/grall2/" --use_home || return 1
  make CONFIG=Release || return 1

  ## INSTALL
  mkdir -p $pkgdir/usr/share
  cp -r data $pkgdir/usr/share/grall2
  mkdir -p $pkgdir/usr/bin
  cp bin/release/GraLL2 $pkgdir/usr/bin/grall2
} 
