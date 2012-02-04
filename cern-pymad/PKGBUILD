# Maintainer: Yngve Inntjore Levinsen <yngve.inntjore.levinsen@cern.ch>

pkgname=cern-pymad
pkgver=20110920
pkgrel=1
pkgdesc="Python interface to Mad-X"
url="http://cern.ch/pymad"
license=("apache2")
depends=('gcc-libs' 'libx11' 'madx-svn' 'python2')
makedepends=('git' 'cython')
arch=('i686' 'x86_64')


_gitroot=https://github.com/pymad/pymad.git
_gitname=cern-pymad

build() {
    if [ -d $_gitname/.git ]; then
      (cd $_gitname && git pull)
    else
      git clone $_gitroot $_gitname
    fi
    cd $srcdir/$_gitname
    msg "GIT clone done or server timeout"

    cd ${srcdir}/${_gitname}/src
    [ -d "build" ] && rm -rf build
    python2 setup.py build
}

package() {
    cd ${srcdir}/${_gitname}/src
    python2 setup.py install --prefix=${pkgdir}/usr
    
}
