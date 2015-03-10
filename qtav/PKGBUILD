# Maintainer: Vishnyakov V. <split7fire at yandex dot ru>

pkgname=qtav
pkgver=1.5
pkgrel=1
pkgdesc="A cross-platform media playback framework based on Qt and FFmpeg"
url="https://github.com/wang-bin/QtAV"
license=('LGPL2' 'GPL3')
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

    msg "Clean build dir"
    rm -rf $srcdir/$_gitname-build

    msg "Connecting to GIT server...."
    if [ -d $srcdir/$_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone -b $pkgver $_gitroot
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
