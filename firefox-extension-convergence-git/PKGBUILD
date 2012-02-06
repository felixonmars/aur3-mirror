# Maintainer: keshto <keshto@gmail.com>
pkgname=firefox-extension-convergence-git
pkgver=20120205
pkgrel=1
pkgdesc="An agile, distributed, and secure strategy for replacing 
Certificate Authorities"
arch=('any')
url="http://convergence.io"
license=('GPL')
depends=('firefox' 'zip' )
makedepends=('git')

_gitroot=https://github.com/moxie0/Convergence.git
_gitname=convergence

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
  cd "$srcdir/$_gitname-build/client"

  make
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/extensions/${emid}
  install -d $dstdir
  mv * $dstdir
  rm $dstdir/Convergence.xpi
  chmod -R 755 $dstdir
}

