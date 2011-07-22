
# by jungo; n10101010@gmail.com

pkgname=passmate-git
pkgver=20110722
pkgrel=1
pkgdesc="Password Manager Application"
url="https://github.com/dancingrobot84/passmate"
arch=('i686' 'x86_64')
license=('The BSD 3-Clause License')
depends=('pcre>=8.12' 'openssl>=1.0.0.d' 'qt>=4.7.2')
makedepends=('git' 'cmake')
conflicts=('passmate')
provides=('passmate-git')

_gitroot="git://github.com/dancingrobot84/passmate.git"
_gitname="passmate"

build() {
    cd ${srcdir}

    msg "Connecting to the git repository..."
    if [ -d ${srcdir}/${_gitname} ]; then
        cd ${_gitname}
        git pull origin
    else
        git clone --depth 1 ${_gitroot}
    fi
    msg "GIT checkout done or server timeout"

    rm -rf ${srcdir}/${_gitname}-build
    cp -r  ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
    cd ${srcdir}/${_gitname}-build

    msg "Configuring with cmake"
    mkdir bin
    cd bin
    cmake -DCMAKE_BUILD_TYPE=Release -DWITH_CLI=1 -DWITH_QT=1 ..

    msg "Starting make..."
    make || return 1
    make DESTDIR=${pkgdir} install || return 1
}
