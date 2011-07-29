pkgver=20110712
pkgrel=1
pkgname="absent"
pkgdesc="Bash script to ease installing from ABS"
url="http://github.com/JohannesSM64/absent"
license="public domain"
arch=("any")
makedepends=("git")
depends=("findutils" "bash" "pacman")
optdepends=()
_gitroot="http://github.com/JohannesSM64/absent.git"
_gitname="absent"

build() {
    cd "$startdir/src"
  
    msg "Connecting to github GIT server...."
    
    if [[ -d "$startdir/src/$_gitname" ]]; then
        cd $_gitname && git pull origin
    else
        git clone "$_gitroot"
        cd $_gitname
    fi
      
    mkdir -p "$startdir/pkg/usr/bin/"
    install -m 755 absent "$startdir/pkg/usr/bin/absent"
}
