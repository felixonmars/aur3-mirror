# Contributor:  Jon Kristian Nilsen <jokr.nilsen@gmail.com>

pkgname=moovida-plugins-bzr
pkgver=1615
pkgrel=1
pkgdesc="Plugins for the Moovida GUI framework."
url="http://moovida.com/"
arch=('i686' 'x86_64')
license=('GPL')

depends=('moovida-bzr')
makedepends=('bzr' 'setuptools')
replaces=('elisa-plugins' 'elisa-plugins-bzr')
options=('!libtool' '!makeflags')
provides=('moovida-plugins-bzr')

_bzrtrunk=lp:moovida
_bzrmod=moovida

build() {
    cd ${srcdir}
  
    msg "Connecting to the server...."
  
    bzr branch ${_bzrtrunk} -q -r ${pkgver}
  
    msg "BZR checkout done or server timeout"
    msg "Starting make..."
  
    [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
    cp -r ./${_bzrmod} ./${_bzrmod}-build
  
    cd ./${_bzrmod}-build/elisa-core
    export PYTHONPATH=$PWD/elisa-core:$PWD/elisa-plugins:$PYTHONPATH

    # Build moovida-plugins-good
    python setup-bundle-plugins-good.py install --prefix=/usr --root=$startdir/pkg || return 1

    # Build moovida-plugins-bad
    python setup-bundle-plugins-bad.py install --prefix=/usr --root=$startdir/pkg || return 1

    # Build moovida-plugins-ugly
    python setup-bundle-plugins-ugly.py install --prefix=/usr --root=$startdir/pkg || return 1

    rm -rf ${srcdir}/${_bzrmod}-build
}

# vim:set ts=2 sw=2 et:
