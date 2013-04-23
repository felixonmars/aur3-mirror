# Contributor: Feng Wang <feng.wang@uni-ulm.de>

pkgname=luabind-git
pkgver=0.9.0
pkgrel=2
pkgdesc="luabind for lua5.2, rpavlik's contribution"
arch=('i686' 'x86_64')
url="http://www.vrac.iastate.edu/vancegroup/docs/luabind/"
license=('MIT')
makedepends=( 'boost' 'boost-build')
depends=('lua' 'gcc-libs')
conflicts=('luabind')
provides=('luabind')
source=()

_gitroot="git://github.com/rpavlik/luabind.git"
_gitname="luabind"

build() 
{
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
    else
    git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    cd ${srcdir}/${_gitname}

    export LUA_PATH=/usr/include
    bjam release --prefix=${pkgdir}/usr/ link=static,shared
}

package() 
{
    cd ${srcdir}/${_gitname}

    bjam release --prefix=${pkgdir}/usr/ link=static,shared install

    # copy license
    install -Dm644 ${srcdir}/${_gitname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

