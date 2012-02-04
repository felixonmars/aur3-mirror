# Maintainer: Marco Maso <demind@gmail.com>
# Contributor: Marco Maso <demind@gmail.com>

pkgname=opencore-amr-git
pkgver=20111116
pkgrel=1
pkgdesc="Implementation of Adaptive Multi Rate Narrowband and Wideband speech codec"
arch=('i686' 'x86_64')
url="http://opencore-amr.sourceforge.net/"
license=('GPL')
depends=()
provides=('amrwb' 'amrnb' 'opencore-amr')
conflicts=('opencore-amr')
source=()
md5sums=()
_gitroot="git://opencore-amr.git.sourceforge.net/gitroot/opencore-amr/"
_gitname="opencore-amr"

build() {

    if [ -d $_gitname ]; then
            msg "Updating from git ..."
            cd $_gitname
            git pull
    else
            msg "Cloning git Tree ..."
            git clone $_gitroot$_gitname
    fi

    cd "$srcdir/$_gitname"

    msg "Starting build ..."
    aclocal && \
    autoheader && \
    libtoolize --automake --copy --force && \
    automake --add-missing --copy && \
    autoconf
    ./configure  --prefix=/usr

    make || return 1

    make DESTDIR=$pkgdir install

}
