# Maintainer: Martin Schulze <mail dot martin dot schulze at gmx dot net>
pkgname=libglvnd-git
pkgver=0.0.0.r46e8cc9
pkgrel=1
pkgdesc="Allows for multiple concurrent GL implementations to coexist on the system"
url="https://github.com/NVIDIA/libglvnd"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=('git' 'autoconf' 'automake' 'libtool' 'xorg-server-devel')
optdepends=() 
provides=('libgl')
# replaces=()
conflicts=('libgl')
#changelog=".Changelog"
options=()

source=($pkgname::'git+https://github.com/NVIDIA/libglvnd.git'
)
md5sums=('SKIP')

prepare(){
    cd "$srcdir/$pkgname"
    ./autogen.sh
    ./configure --prefix=/usr
}

pkgver(){
    cd "$srcdir/$pkgname"
    local _ver="0.0.0"
    local _rev=`git rev-parse --short HEAD`
    printf "%s.r%s" "$_ver" "$_rev"
}

build(){
    cd "$srcdir/$pkgname"
    local _MAKE_OPTS=""
    if [ ${MAKE_PARALLEL} ]; then
	$_MAKE_OPTS += "-j ${MAKE_PARALLEL}"
    fi
    make $_MAKE_OPTS
}

package() {
    cd "$srcdir/$pkgname" 
    make DESTDIR=${pkgdir} install
}
