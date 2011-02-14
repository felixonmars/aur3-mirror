# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=lsit
pkgver=20110214
pkgrel=1
pkgdesc="Linux System Information Tool"
arch=('any')
url="https://github.com/trizen/lsit"
license=('GPL')
makedepends=('git')
depends=('perl')
_gitroot="git://github.com/trizen/$pkgname.git"
_gitname="$pkgname"

build() {
    cd "$startdir/src"
  
    msg "Connecting to github GIT server...."
    
    if [ -d "$startdir/src/$_gitname" ] ; then
        cd $_gitname && git pull origin
    else
        git clone "$_gitroot"
        cd $_gitname
    fi
    
    install -m 755 -D $pkgname "$pkgdir/usr/bin/$pkgname"
}
