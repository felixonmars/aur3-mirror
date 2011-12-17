pkgver=20111217
pkgrel=1
pkgname="absolution"
pkgdesc="A very rudimentary bash script to make the use of abs easier"
url="http://github.com/t4k1t/Absolution"
license="GPLv3"
arch=("any")
makedepends=("git")
depends=("findutils" "bash" "pacman" "abs" "vim")
optdepends=()
_gitroot="http://github.com/t4k1t/Absolution.git"
_gitname="Absolution"

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
    install -m 755 absolution "$startdir/pkg/usr/bin/absolution"
}
