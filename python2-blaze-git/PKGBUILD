# Maintainer: Igor Babuschkin <ibabuschkin at gmail dot com>

pkgname=python2-blaze-git
pkgver=20130124
pkgrel=1
pkgdesc="Blaze is the next generation of NumPy"
url="https://github.com/continuumio/blaze-core"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python'
         'python2-numba-git'
         'python2-meta-git'
         'python2-nose'
         'python2-ply')
makedepends=(git)
conflicts=()
replaces=()
backup=()
source=()

_gitroot=https://github.com/ContinuumIO/blaze-core.git
_gitname=blaze-core

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

  python2 setup.py install \
    --prefix=/usr \
    --root=$pkgdir
}
