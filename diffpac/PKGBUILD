pkgname=diffpac
pkgver=20100118
pkgrel=1
pkgdesc="Stand alone replacment for pacdiffviewer"
url="http://github.com/bruenig/diffpac"
license="GPL"
arch=('i686' 'x86_64')
makedepends=('git')
depends=('grep' 'sed' 'coreutils' 'bash' 'awk' 'pacman' 'diffutils' 'patch' 'findutils')
optdepends=('colordiff: colorized diff output')
_gitroot='git://github.com/bruenig/diffpac.git'
_gitname='diffpac'

build() {
    cd "$startdir/src"
  
    msg "Connecting to github GIT server...."
    
    if [ -d "$startdir/src/$_gitname" ] ; then
        cd $_gitname && git pull origin
    else
        git clone "$_gitroot"
        cd $_gitname
    fi
      
    mkdir -p "$startdir/pkg/usr/bin/"
    install -m 755 diffpac "$startdir/pkg/usr/bin/diffpac"
}

