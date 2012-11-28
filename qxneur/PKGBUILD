# Maintainer: Aleksey Ksenzov aka KsenZ <aksenzov@gmail.com>
pkgname=qxneur
pkgver=20121128
pkgrel=1
pkgdesc="Qt frontend for xneur"
arch=('i686' 'x86_64')
url="https://gitorious.org/qxneur"
license=('GPLv2')
depends=('qt' 'xneur')
makedepends=('gcc' 'make' 'cmake' 'git' 'pkgconfig')

_gitroot="git://gitorious.org/~ksenz/qxneur/ksenz-qxneur.git"
_gitname="qxneur"

build() {
#build qxneur from git
    if [ -d $srcdir/$_gitname ] 
    then
        msg "Updating local repository for qxneur..."
        cd $_gitname
        git pull origin || return 1
	msg "The local files are updated."

    else
	git clone $_gitroot $_gitname
	cd $srcdir/$_gitname
    fi

    msg "git checkout done or server timeout"
    msg "Creating temporary build directory..."
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            #Core
    msg "Building and installing qxneur..."
    cd $srcdir/$_gitname
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release . || return 1
    make || return 1
    install -Dm 755 qxneur $pkgdir/usr/bin/qxneur || return 1
    install -Dm 644 qxneur_ru.qm $pkgdir/usr/share/qxneur/translations/qxneur_ru.qm || return 1
    cp -R images $pkgdir/usr/share/qxneur || return 1
    cd $srcdir
}