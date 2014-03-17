# Maintainer: Marc Luehr <marcluehr@gmail.com>
pkgname=colormake-dcjones-git
pkgver=20130316
pkgrel=2
pkgdesc="A simple wrapper around make to make it's output more readable (python version of colormake-git)"
arch=('i686' 'x86_64')
url="https://github.com/dcjones/colormake"
license=('GPL')
depends=('python')
makedepends=('git')
md5sums=() #generate with 'makepkg -g'
conflicts=('colormake-git')

_gitroot=$url'.git'
_gitname='colormake-dcjones'

build() {
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

}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p ${pkgdir}/usr/bin/
  cp colormake.py colormake ${pkgdir}/usr/bin/
}

# vim:set ts=2 sw=2 et:
