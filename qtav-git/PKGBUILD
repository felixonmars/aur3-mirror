# public domain

pkgname=qtav-git
pkgver=20140413
pkgrel=1
pkgdesc="qt multimedia framework"
url="https://github.com/wang-bin/QtAV"
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt5-base')
makedepends=('qt5-base' 'git')
provides=('qtav')

_gitroot='https://github.com/wang-bin/QtAV.git'
_gitname='QtAV'

source=()
md5sums=()

build()
{
    cd $srcdir

    msg "Connecting to GIT server...."
    if [ -d $srcdir/$_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi
    msg "GIT checkout done or server timeout"

    msg "Starting make..."

    if [ -d $srcdir/$_gitname-build ]; then
        rm -r $srcdir/$_gitname-build
    fi
    cp -r $srcdir/$_gitname $srcdir/$_gitname-build
    cd $srcdir/$_gitname-build

    qmake-qt5 || return 1
    make PREFIX=/usr || return 1
}

package()
{
    cd $srcdir/$_gitname-build
    make INSTALL_ROOT="$pkgdir" install || return 1
}
