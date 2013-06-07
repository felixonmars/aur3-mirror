# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Cong Gu <gucong43216@gmail.com>
pkgname=guile-scsh-git  
pkgver=0.2
pkgrel=1
pkgdesc="A Unix shell embedded in Guile Scheme 2"
url="https://gitorious.org/guile-scsh/guile-scsh"
arch=('i686' 'x86_64')
license=('GPL')
depends=('guile>=2.0')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://gitorious.org/guile-scsh/guile-scsh.git"
_gitname="guile-scsh"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull master
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

}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p "$pkgdir/usr/share/guile/site/2.0"
  mkdir -p "$pkgdir/usr/share/doc/$_gitname"
  mkdir -p "$pkgdir/usr/bin"
  cp -r scsh "$pkgdir/usr/share/guile/site/2.0"
  cp docs/cheat.txt "$pkgdir/usr/share/doc/$_gitname"
  cp guile-scsh.scm "$pkgdir/usr/bin"
}
