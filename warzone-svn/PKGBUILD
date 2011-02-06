# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Markus Pargmann <scosu@gmx.de>

pkgname=warzone-svn
pkgver=7703
pkgrel=1
pkgdesc="3D realtime strategy game on a future Earth (svn version)"
arch=('i686' 'x86_64')
url="http://wz2100.net/"
license=('GPL')
depends=('sdl_net' 'libgl' 'openal' 'libjpeg' 'libpng' 'libvorbis' 'libmad' 'physfs' 'quesoglc' 'flex' 'sqlite3')
makedepends=('subversion' 'gawk' 'zip' 'unzip' 'rsync' 'pkgconfig')
conflicts=('warzone')
provides=('warzone')
source=()
md5sums=()
options=('!strip')
export CFLAGS="-g -pipe"
export CXXFLAGS="-g -pipe"

_svntrunk=http://warzone2100.svn.sourceforge.net/svnroot/warzone2100/trunk 
_svnmod=warzone

build() {
    cd $srcdir
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    msg "SVN checkout done or server timeout"

    msg "Preparing build dir"
    rsync -a --delete $_svnmod/ build/ || return 1
    cd build || return 1

    msg "Starting build"
    ./autogen.sh 
    ./configure --prefix=/usr --enable-data --enable-debug=yes
    sed -i -e 's/#define _XOPEN_SOURCE 600/#ifndef _XOPEN_SOURCE\n# define _XOPEN_SOURCE 600\n#endif/' config.h

    make || return 1
    make DESTDIR=$pkgdir install || return 1
}
