# Contributor: Stas Bourakov <sbourakov(at)gmail.com>
pkgname=libxmlccwrap
pkgver=20110726
pkgrel=1
pkgdesc="libxmlccwrap - a C++ wrapper around libxml2"
arch=('i686' 'x86_64')
url="http://git.opendreambox.org/?p=obi/libxmlccwrap.git;a=summary"
license=('GPL2')
depends=('gcc-libs')
makedepends=('git' 'make')
conflicts=()

_gitroot='git://git.opendreambox.org/git/obi/libxmlccwrap.git'
_gitname='libxmlccwrap'

build() {

    cd $startdir/src

    msg "git clone git://git.opendreambox.org/git/obi/libxmlccwrap.git...."

    if [ -d $startdir/src/$_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
        cd $_gitname
    fi
    ./configure --prefix=/usr || return 1
    make || return 1
    make install DESTDIR=$pkgdir || return 1
}
