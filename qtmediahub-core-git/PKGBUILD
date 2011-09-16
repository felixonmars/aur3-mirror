pkgname=qtmediahub-core-git
pkgver=20110916
pkgrel=1
pkgdesc='A cross platform media hub built using Qt and QtQuick'
arch=('i686' 'x86_64')
url='http://www.qtmediahub.com'
license=('BSD')
depends=('qt>=4.7' 'taglib' 'libexif' 'qt-mobility>=1.2')
source=()
md5sums=()

_gitroot="git://gitorious.org/qtmediahub/qtmediahub-core.git"
_gitname="qtmediahub-core"

build() {
    msg "Connecting to GIT server...."

    if [ -d "$srcdir/$_gitname" ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone --depth=1 $_gitroot
    fi
    
    msg "GIT checkout done or server timeout"
    
    cd "$srcdir/$_gitname"
    
    git clean -fxd
    qmake PREFIX="/usr" "CONFIG-=debug"
    qmake PREFIX="/usr" "CONFIG-=debug"
    make -j4
}

package() {
    cd "${srcdir}/$_gitname"
    
    make INSTALL_ROOT=${pkgdir} install
}
