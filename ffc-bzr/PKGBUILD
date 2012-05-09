# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=ffc-bzr
pkgver=1751
pkgrel=1
pkgdesc="A compiler for finite element variational forms."
arch=(any)
url="http://launchpad.net/ffc"
license=('GPL')
groups=('fenics-bzr')
depends=('python2' 'fiat' 'ufc' 'ufl' 'python2-numpy')
optdepends=('FErari: optimisation support')
makedepends=('bzr' 'python2')
provides=('ffc')
conflicts=('ffc')
options=(!emptydirs)

_bzrtrunk=lp:ffc
_bzrmod=ffc

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
    python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
