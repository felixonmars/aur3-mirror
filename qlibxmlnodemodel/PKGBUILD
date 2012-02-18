# Maintainer: Your Name <youremail@domain.com>
pkgname=qlibxmlnodemodel
pkgver=20120218
pkgrel=2
epoch=
pkgdesc="A QAbstractXmlNodeModel for using with libxml2 library"
arch=('i686' 'x86_64')
url="https://github.com/atorkhov/qlibxmlnodemodel"
license=('custom')
groups=()
depends=('qt' 'libxml2')
makedepends=('git' 'gcc-libs-multilib')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=https://github.com/atorkhov/qlibxmlnodemodel.git
_gitname=qlibxmlnodemodel

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."
    
    cd "$srcdir/$_gitname"
    rm -rf build
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr || exit 1
    make
}

package() {
    cd "$srcdir/$_gitname/build"
    cp -R $srcdir/$_gitname/src/* $srcdir/$_gitname/build/src/
    make DESTDIR="$pkgdir/" install || exit 2
    mkdir -p $pkgdir/usr/share/licenses/qlibxmlnodemodel
    cp $srcdir/$_gitname/COPYING $pkgdir/usr/share/licenses/qlibxmlnodemodel/LICENSE
}

# vim:set ts=2 sw=2 et:
