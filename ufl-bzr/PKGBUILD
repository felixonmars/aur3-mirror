# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=ufl-bzr
pkgver=1436
pkgrel=1
pkgdesc="Unified form language."
arch=('any')
url="https://launchpad.net/ufl"
license=('LGPL')
groups=('fenics-bzr')
depends=('python2')
makedepends=('bzr' 'python2')
provides=('ufl')
conflicts=('ufl')
options=(!emptydirs)

_bzrtrunk=lp:ufl
_bzrmod=ufl

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

    find ./ -name "*" -type f -exec \
	sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;

    python2 setup.py install --prefix=/usr --root="$pkgdir"
}

package() {
    return 0
}
