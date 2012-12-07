# Maintainer: Daniel Wallace <daniel.wallace at gatech dot edu>
pkgname=acdfuse-git
pkgver=20121206
pkgrel=1
pkgdesc="mount amazon cloud drive"
arch=('any')
url="https://github.com/handyman5/acd_fuse"
license=('GPL')
depends=('python2' 'python2-fuse')
makedepends=('git')

_gitroot=https://github.com/handyman5/acd_fuse.git
_gitname=acdfuse

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin && git submodule update
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
    cd $_gitname
    git submodule init
    git submodule update
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone --recursive "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  sed -i 's/python/python2/' pyacd/pyacd/*
}

package() {
  install -d "$pkgdir/usr/share/amazon"
  cd "$srcdir/$_gitname-build"
  cp -dpr --no-preserve=ownership pyacd/* "$pkgdir/usr/share/amazon/"
  install -Dm755 acd "$pkgdir/usr/share/amazon"
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/share/amazon/acd" "$pkgdir/usr/bin/amazon"
}

# vim:set ts=2 sw=2 et:
