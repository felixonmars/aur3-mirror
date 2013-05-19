# Contributor: Erik Hardesty <dalingrin@gmail.com>
pkgname=pbfetch-git
_pkgname=pbfetch
pkgver=20110913
pkgrel=1
pkgdesc="A simple script for Arch linux to simplify AUR package management"
arch=('any')
url=('http://github.com/dalingrin/pbfetch')
license=('GPL')
depends=('sudo' 'curl')
optdepends=('pacman-color: matches output if color is used')
makedepends=('git')
backup=('etc/pbfetch.conf')

_gitroot="git://github.com/dalingrin/pbfetch.git"
_gitname="pbfetch"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  
  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else     
    git clone $_gitroot && cd $_gitname
  fi
 
  install -D -m644 ./config/$_pkgname.conf $pkgdir/etc/$_pkgname.conf || return 1 
  install -D -m755 ./$_pkgname $pkgdir/usr/bin/$_pkgname || return 1
} 
