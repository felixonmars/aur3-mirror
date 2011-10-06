pkgname=backpac
pkgver=20111005
pkgrel=1
pkgdesc="A package state snapshot and restore tool for Arch Linux with config file save/restore support."
url="http://github.com/altercation/backpac"
license="GPL"
arch=('any')
makedepends=('git')
depends=('grep' 'sed' 'bash' 'wget' 'pacman')
optdepends=('sudo: install and update packages as non-root')
_gitroot='http://github.com/altercation/backpac.git'
_gitname='backpac'

build() {
    cd "$startdir/src"
  
    msg "Connecting to github git server...."
    
    if [ -d "$startdir/src/$_gitname" ] ; then
        cd $_gitname && git pull origin
    else
        git clone "$_gitroot"
        cd $_gitname
    fi
      
    install -D backpac "$startdir/pkg/usr/bin/backpac"
    install -D lib/common "$startdir/pkg/usr/share/backpac/lib/common"
    install -D lib/local "$startdir/pkg/usr/share/backpac/lib/local"
    #install -Dm 644 backpac.8 "$startdir/pkg/usr/share/man/man8/backpac.8"
}


