# Maintainer: Miguel Paolino <mpaolino at gmail com>
pkgname=ifshow-git
pkgver=20110712
pkgrel=1
pkgdesc="A next-generation tool to display the status of network interfaces"
arch=('i686' 'x86_64')
url="http://github.com/awgn/ifshow"
license=('GPL')
groups=
provides=
depends=('gcc-libs' 'pciutils')
optdepends=('net-tools' 'ethtool')
makedepends=('git' 'cmake' 'gcc')
conflicts=()
replaces=()
backup=()
install=
source=()
md5sums=()

_gitroot="git://github.com/awgn/ifshow.git"
_gitname="ifshow"

build() {
    cd "$srcdir"
    if [[ -d "$_gitname" ]] ; then
        git pull origin || return 1
    else
        git clone "$_gitroot" "$_gitname" || return 1
    fi  
    cd $_gitname
    cmake ./
    make
    mkdir -p "$pkgdir/usr/sbin"
    install -o root -g root -m 755 ifshow "$pkgdir/usr/sbin/ifshow"
}

