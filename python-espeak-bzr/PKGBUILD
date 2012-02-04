# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=python-espeak-bzr
pkgver=16
pkgrel=1
pkgdesc="Python bindings for eSpeak."
url="https://launchpad.net/python-espeak"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('espeak' 'python2')
makedepends=('bzr')

_bzrtrunk=lp:python-espeak
_bzrmod=python-espeak

build() {
    cd $srcdir
  
    msg "Connecting to the server...."
  
    bzr branch $_bzrtrunk -q -r $pkgver
  
    msg "BZR checkout done or server timeout"
    msg "Starting make..."
  
    [ -d ./$_bzrmod-build ] && rm -rf ./$_bzrmod-build
    cp -r ./$_bzrmod ./$_bzrmod-build

    cd python-espeak
    python2 setup.py install --root $pkgdir
}