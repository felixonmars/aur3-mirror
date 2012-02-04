# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=qmviewer-git
pkgver=20100815
pkgrel=1
pkgdesc="The Manga Viewer for Qt and KDE"
arch=('i686' 'x86_64')
url="http://sd-22103.dedibox.fr/qmviewer/"
license=('GPL')
depends=('libxml2' 'qt')
optdepends=('imagemagick')
makedepends=('cmake' 'git')

_gitroot="git://gitorious.org/qmviewer/qmviewer.git"
_gitname="qmviewer"

build() {
    cd $srcdir
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
    else
    git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf $srcdir/$_gitname-build
    git clone $srcdir/$_gitname $srcdir/$_gitname-build
    cd $srcdir/$_gitname-build

    cmake -DCMAKE_INSTALL_PREFIX='/usr'
    make
    mkdir $pkgdir/usr
    cp -R bin/ lib/ $pkgdir/usr

    # Desktop icon
    install -Dm644 src/apps/image/splash.png  $pkgdir/usr/share/pixmaps/qmviewer.png
    install -Dm644 $startdir/qmviewer.desktop $pkgdir/usr/share/applications/qmviewer.desktop
}