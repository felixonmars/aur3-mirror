# Contributor: Tilo Brueckner  blueperil at gmx de

pkgname=kopete-fetion-git
pkgver=20110211
pkgrel=1
pkgdesc="Fetion for Kopete is a protocol plugin for Kopete allowing access to the China Mobile Fetion."
arch=('i686' 'x86_64')
url="http://gitweb.kde.org/scratch/nihui/kopete-fetion.git"
license=('GPL')
depends=('kdenetwork-kopete' 'openssl')
makedepends=('make' 'cmake' 'automoc4')

_gitroot=git://anongit.kde.org/scratch/nihui/kopete-fetion
_gitname=kopete-fetion

build() {
    msg "Connecting to anongit.kde.org GIT server...."

    if [ -d $srcdir/$_gitname ] ; then
        cd $_gitname && git reset --hard HEAD && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
        cd $_gitname
    fi
    
    cd $srcdir/$_gitname

    cd $srcdir/

    if [ ! -d build ] ; then
        mkdir build
    fi

    cd build
    cmake ../$_gitname -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
    make || return 1
}
package() {
  cd $srcdir/build

  make DESTDIR=$pkgdir install || return 1
}
md5sums=('df7b2eb26694c44af5a276d4a0a6e7b8')
md5sums=('f652fcc6e5abbc72e52f585d1b0db82b')
