pkgname=oxofrmbl-git
_gitname=oxofrmbl
_buildir="$_gitname-build"
pkgver=26.250f6b7
pkgrel=1
pkgdesc="An extensible minimal open source IM-Client using Qt"
arch=('i686' 'x86_64')
url="https://github.com/astralaster/oxofrmbl"
license=('MIT')
depends=('qxmpp-qt5-git' 'qt5-base')
makedepends=('git')
source=('git+https://github.com/astralaster/oxofrmbl.git')
 
md5sums=('SKIP')
 
pkgver() {
    cd $_gitname
    # Use the tag of the last commit
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
 
build() {
    cd "$srcdir/$_gitname"

    msg 'Running qmake...'
    qmake PREFIX="$pkgdir/usr" CONFIG+="release"

    msg 'Running make...'
    make PREFIX="$pkgdir/usr"
}
 
package() {
    cd "$srcdir/$_gitname/"
    make install
}
