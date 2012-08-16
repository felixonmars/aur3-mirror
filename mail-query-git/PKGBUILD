# Maintainer: Tom Vincent <http://tlvince.com/contact/>

pkgname=mail-query-git
pkgver=20120804
pkgrel=1
pkgdesc="Query a maildir's contents and print from info for use in mutt"
arch=("any")
url="https://github.com/pbrisbin/mail-query"
license=("GPL")
makedepends=("git")

_gitroot="git://github.com/pbrisbin/mail-query.git"
_gitname="mail-query"

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

  make
}

package() {
  cd "$srcdir/$_gitname-build"

  install -Dm755 mail-query $pkgdir/usr/bin/mail-query
} 
