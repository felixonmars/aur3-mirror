pkgname=hex2hcd-git
pkgver=20140921
pkgrel=1
pkgdesc="Converter to change bluetooth hex firmware files to hcd"
arch=('i686' 'x86_64')
url="git://github.com/jessesung/hex2hcd.git"
license=('GPL2')
depends=('gcc-libs')
makedepends=('git' 'make')
_gitroot='git://github.com/jessesung/hex2hcd.git'
_gitname='hex2hcd'

build() {

    cd $startdir/src

    msg "Connecting to the GIT server...."

    if [ -d $startdir/src/$_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
        cd $_gitname
    fi

    cd $startdir/src/hex2hcd

    make
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cp -r hex2hcd/hex2hcd ${pkgdir}/usr/bin/
}

