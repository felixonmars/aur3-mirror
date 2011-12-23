pkgver=20111223
pkgrel=1
pkgname="absolution"
pkgdesc="A very rudimentary bash script to make the use of abs easier"
url="http://github.com/t4k1t/Absolution"
license="GPL3"
arch=("any")
makedepends=("git")
depends=("findutils" "sh" "pacman" "abs" "vim")
optdepends=("sudo: updating abs tree as user")
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
