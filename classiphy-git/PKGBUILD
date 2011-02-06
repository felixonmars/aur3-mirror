# Maintainer: Bruce Hsu <brucehsu@gmail.com>
pkgname=classiphy-git
pkgver=20101211
pkgrel=2
pkgdesc="A cross platform photo classifying software"
arch=('any')
makedepends=('git')
url="https://github.com/brucehsu/classiphy/wiki"
license=('GPL')
depends=('qt')
install=
_gitroot='http://github.com/brucehsu/classiphy.git'
_gitname='classiphy'

build() {
    cd "$startdir/src"
  
    msg "Connecting to github GIT server...."
    
    if [ -d "$startdir/src/$_gitname" ] ; then
        cd $_gitname && git pull "$_gitroot"
    else
        git clone "$_gitroot"
        cd $_gitname
    fi

    qmake PREFIX="/usr" "DEFINES+=PERSONAL_PROFILE"
    make
    make INSTALL_ROOT=$pkgdir install
}

# vim:set ts=2 sw=2 et:
