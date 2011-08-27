# Maintainer: Dimitri 'Skypers' SABADIE <skypers@tuxfamily.org>
# Contributor: Dimitri 'Skypers' SABADIE <skypers@tuxfamily.org>
pkgname=ncursesppw
pkgver=0.1
pkgrel=2
pkgdesc="A C++ wrapper for the ncurses C library"
arch=(any)
license=('GPL')
url="http://git.tuxfamily.org/ncursesppw/ncursesppw.git"
groups=
provides=
depends=('ncurses>=5.7')
optdepends=
makedepends=('git' 'libstdc++5' 'boost')
conflicts=
replaces=
install=
source=()
md5sums=('e1c7a97f1be01946ad4dfa6b79e63dd8')
_gitroot="git://git.tuxfamily.org/gitroot/$pkgname/$pkgname.git"

build()
{
    msg "Getting sources from the git repository ..."
    if [[ -d $pkgname ]] ; then
        git pull master || return 1
        msg "Up to date"
    else
       git clone $_gitroot || return 1
       msg "Sources downloaded"
    fi

    cd $pkgname
    make || return 1
                    
    msg "Installing ..."
    mkdir -p $pkgdir/usr/lib/
    mkdir -p $pkgdir/usr/include/ncursesppw/
    #mkdir -p $pkgdir/usr/share/doc/$pkgname
    #mkdir -p $pkgdir/usr/man/$pkgname
                    
    cp libncursesppw.so $pkgdir/usr/lib
    cp -r include/ncursesppw/* $pkgdir/usr/include/ncursesppw/
                    
    #msg "Creating documentation and man ..."
}
