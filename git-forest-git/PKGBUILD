# Maintainer: nem <nem at ikitten dot co dot uk>
# Contributor: Ramana Kumar <firstname.lastname@gmail.com>
pkgname=git-forest-git
pkgver=20121205
pkgrel=1
pkgdesc="Text-based tree visualizer for git"
arch=('i686' 'x86_64')
url="http://inai.de/projects/hxtools"
license=('GPL')
depends=('perl' 'git')
makedepends=('git')

_gitroot="git://git.inai.de/hxtools"
_gitname="hxtools"

build() {
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

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  install -D sdevel/git-forest $pkgdir/usr/bin/git-forest
  mkdir -p $pkgdir/usr/share/man/man1
  gzip -c doc/git-forest.1 > $pkgdir/usr/share/man/man1/git-forest.1.gz
}
