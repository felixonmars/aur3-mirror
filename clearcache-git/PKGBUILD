# Contributor: Daniel Mills <dm@e36freak.com>

pkgname=clearcache-git
pkgver=20121023
pkgrel=1
pkgdesc="Simple tool for selectively clearing the pacman cache"
arch=('i686' 'x86_64')
url="http://github.com/e36freak/clearcache"
license=('MIT')
depends=('bash>=4.0' 'libarchive' 'awk')
makedepends=('git')
optdepends=('sudo')
_gitroot='http://github.com/e36freak/clearcache.git'
_gitname='clearcache'

build() {
  cd "$scrdir"
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi

  install -m 755 -D clearcache "$pkgdir/usr/bin/clearcache"
}

# vim: ft=sh syn=sh et
