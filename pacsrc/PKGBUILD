# Maintainer : Fatih Bostancı <faopera@gmail.com>
pkgname=pacsrc
pkgver=20110726
pkgrel=1
pkgdesc="A package search command line tool for Archlinux, Pardus, Mageia and Ubuntu"
url="https://gitorious.org/pacsrc"
license="GPL"
arch=('any')
makedepends=('git')
depends=('bash' 'sed' 'gawk' 'grep' 'curl')
optdepends=()
_gitroot='git://gitorious.org/pacsrc/pacsrc.git'
_gitname='pacsrc'

build() {

  msg "Connecting to Gitorious GIT server...."
    
    if [ -d "$startdir/src/$_gitname" ]; then
        cd $_gitname && git pull origin
    else
        git clone "$_gitroot"
        cd $_gitname
    fi
      
  install -Dm755 pacsrc "$pkgdir/usr/bin/pacsrc"
} 
