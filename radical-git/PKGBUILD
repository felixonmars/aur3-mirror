# Maintainer: Raphael Scholer <rscholer@gmx.de>
pkgname=radical-git
pkgver=20100901
pkgrel=2
pkgdesc="Useful bindings and functions for awesome"
arch=('any')
url="http://github.com/rscholer/radical"
license=('GPL3')
depends=('awesome' 'procps')
optdepends=('dmenu: dmenu support')
makedepends=('git')

_gitroot="git://github.com/rscholer/radical.git"
_gitname="radical"

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
} 

package() {
  cd "$srcdir/$_gitname-build"

  find ./doc -type f -exec chmod 644 "{}" \;
  find ./doc -type d -exec chmod 755 "{}" \;
  install --verbose -m 755 -d $pkgdir/usr/share/doc/radical
  mv --verbose ./doc/* $pkgdir/usr/share/doc/radical/
  install --verbose -m 755 -d $pkgdir/usr/share/awesome/lib/radical
  install --verbose -m 664 ./src/*.lua $pkgdir/usr/share/awesome/lib/radical
}
