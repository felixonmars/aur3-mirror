# Maintainer: kennytm <kennytm@gmail.com>
# Contributor: kennytm <kennytm@gmail.com>

pkgname=lib32-zeromq-git
pkgver=20120528
pkgrel=1
pkgdesc="Fast messaging system built on sockets. aka 0MQ, ZMQ. (32-bit)"
arch=('x86_64')
url="http://www.zeromq.org/"
license=('LGPL')
makedepends=('git' 'autoconf' 'gcc-multilib')
provides=('zeromq' 'lib32-zeromq')
conflicts=('zeromq')

_gitroot="git://github.com/zeromq/libzmq.git"
_gitname="zeromq"

build() {
    msg "Connecting to git server..."
    if [ -d $_gitname ]; then
        cd $_gitname && git pull origin master
        msg "The local files are updated."
    else
        git clone --depth=1 $_gitroot $_gitname
    fi
    msg "git checkout done or server timeout"

    export CC="gcc -m32"
    export CXX="g++ -m32"

    # It seems this thing can't be built outside of its own directory.
    rm -rf "$srcdir/$_gitname-build"
    cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"

    cd "$srcdir/$_gitname-build"
    ./autogen.sh
    ./configure --prefix=/usr --libdir=/usr/lib32 --with-pgm
    sed -i 's/python$/&2/' foreign/openpgm/build-staging/openpgm/pgm/{Makefile,version_generator.py}
    make
}

check() {
    cd "$srcdir/$_gitname-build"
    #make -k check
}

package() {
    cd "$srcdir/$_gitname-build"
    make DESTDIR="$pkgdir/" install
}

