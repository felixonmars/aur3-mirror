# Maintainer: jugyo <jugyo.org@gmail.com>
# Contributor: Localizator <localizator@ukr.net>

pkgname=termtter-git
pkgver=20120127
pkgrel=1
pkgdesc="Termtter is a terminal based Twitter client."
arch=(any)
groups=(network)
url="http://termtter.org/"
license=('GPL')
depends=('git' 'ruby')

_gitroot="git://github.com/jugyo/termtter.git"
_gitname="termtter"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  msg "Installing..."
  sudo gem install termtter
} 