# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=ufc-bzr
pkgver=351
pkgrel=1
pkgdesc="A unified framework for finite element assembly."
arch=('i686' 'x86_64')
url="http://launchpad.net/ufc"
license=('?')
groups=('fenics-bzr')
depends=('python2') # 'boost' 'swig')
makedepends=('bzr' 'python2')
provides=('ufc')
conflicts=('ufc')
options=(!emptydirs)

_bzrtrunk=lp:ufc
_bzrmod=ufc

build() {
    msg "Connecting to Bazaar server...."

    if [ -d $_bzrmod ]; then
	cd $_bzrmod && bzr pull $_bzrtrunk -r $pkgver && cd ..
	msg "The local files are updated."
    else
	bzr branch $_bzrtrunk $_bzrmod -r $pkgver
    fi

    msg "BZR checkout done or server timeout"
    msg "Starting make..."

    [ -d $_bzrmod-build ] && rm -rf $_bzrmod-build
    cp -r $_bzrmod $_bzrmod-build
    cd $_bzrmod-build

    # replace python with python2 everywhere
    find ./ -name "*" -type f -exec \
	sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;

    [[ -e build ]] || mkdir build 
    cd build

    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
	     -DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 \
	     -DPYTHON_INCLUDE_DIR:PATH=/usr/include/python2.7 \
             -DPYTHON_LIBRARY:FILEPATH=/usr/lib/libpython2.7.so
    make
}

package() {
    cd $srcdir/$_bzrmod-build/build
    make install DESTDIR=$pkgdir
}

# vim:set ts=2 sw=2 et:
