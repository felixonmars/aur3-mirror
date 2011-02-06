# Contributor: zajca <zajcaa at gmail dot com>

pkgname=nephilim-git
pkgver=20090819
pkgrel=1
pkgdesc="Experimental mpd client using Qt4 and writen in python with animelyrics support."
arch=('i686')
url="http://repo.or.cz/w/nephilim.git"
license=('GPL')
depends=('mpd' 'mpc' 'zsi' 'python' 'qt' 'pyqt' 'python-lxml')
makedepends=('git')
source=(script_nephilim)
md5sums=('40055b14dfc27dcb4a9b9101c88c2b2a')

_gitroot=http://repo.or.cz/r/nephilim.git
_gitname=nephilim


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
cp -r $startdir/src/nephilim $startdir/pkg/usr/share/nephilim

install -D -m755 $startdir/src/script_nephilim $startdir/pkg/usr/bin/nephilim
}
