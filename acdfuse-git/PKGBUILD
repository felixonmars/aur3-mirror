# Maintainer: Daniel Wallace <daniel.wallace at gatech dot edu>
pkgname=acdfuse-git
pkgver=20120329
pkgrel=1
pkgdesc="mount amazon cloud drive"
arch=('any')
url="https://github.com/handyman5/acd_fuse"
license=('GPL')
depends=('python2')
makedepends=('git')

_gitroot=https://github.com/handyman5/acd_fuse.git
_gitname=acdfuse
_gitroot2=https://github.com/handyman5/pyamazonclouddrive-clone.git
_gitname2=acd

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  cd "$srcdir"
  if [[ -d "$_gitname2" ]]; then
    cd "$_gitname2" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot2" "$_gitname2"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  rm -rf "$srcdir/$_gitname2-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname2" "$srcdir/$_gitname2-build"
  cd "$srcdir/$_gitname2-build"
  sed -i 's/python/python2/' pyacd/*
  cd "$srcdir/$_gitname-build"
}

package() {
  install -d "$pkgdir/usr/share/amazon"
  cd "$srcdir/$_gitname2-build"
  cp -dpr --no-preserve=ownership pyacd "$pkgdir/usr/share/amazon/"
  cd "$srcdir/$_gitname-build"
  install -Dm766 acd "$pkgdir/usr/share/amazon"
  install -d "$pkgdir/usr/bin"
  ln -s "$pkgdir/usr/share/amazon/acd" "$pkgdir/usr/bin/amazon"
}

# vim:set ts=2 sw=2 et:
