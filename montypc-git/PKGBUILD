# Contributor: Nick B <Shirakawasuna at gmail dot com>

pkgname=montypc-git
pkgver=20090109
pkgrel=1
pkgdesc="A Pythonesque mpd client using Qt4."
arch=('i686')
url="http://jerous.psboard.org/montypc/"
license=('GPL')
depends=('mpc' 'kdebindings' 'python' 'qt')
makedepends=('git')
source=(script_montypc)
md5sums=('6fff797f6fe20cc0f41c38721bb2cdfa')

_gitroot=http://git.jerous.psboard.org/montypc
_gitname=montypc

build() {

    cd $startdir/src

    msg "Connecting to GIT server...."

    if [ -d $startdir/src/$_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
        cd $_gitname
    fi

mkdir -p $startdir/pkg/usr/{bin,share}
cp -r $startdir/src/montypc $startdir/pkg/usr/share/montypc

install -D -m755 $startdir/src/script_montypc $startdir/pkg/usr/bin/montypc
}
