# Maintainer: Mark Foxwell fastfret79@archlinux.org.uk

pkgname=vala-notmuch
pkgver=20110710
pkgrel=1
pkgdesc="a notmuch address book in vala"
url="https://github.com/spaetz/vala-notmuch"
arch=('any')
license=('GPL2')
makedepends=('vala')
depends=('notmuch')
install=vala-notmuch.install

_gitroot="git://github.com/spaetz/vala-notmuch.git"
_gitname="master"

build() {
  cd "$srcdir"
  msg 'Connecting to GIT server...'

  if [ -d $_gitname ] ; then
    cd $_gitname; git pull origin
    msg 'The local files are updated.'
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/src"

  ./make 

} 

package() {

  cd "$srcdir/$_gitname-build/src"

  install -D -m755 addrlookup ${pkgdir}/usr/bin/addrlookup

}

# vim:set ts=2 sw=2 et:
