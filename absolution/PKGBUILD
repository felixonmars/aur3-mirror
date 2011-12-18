pkgver=20111218
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
    cd "$srcdir"
  
    msg "Connecting to github GIT server...."
    
    if [[ -d "$srcdir/$_gitname" ]]; then
        cd $_gitname && git pull origin
    else
        git clone "$_gitroot"
        cd $_gitname
    fi
      
    install -Dm 755 absolution "$pkgdir/usr/bin/absolution"
}
