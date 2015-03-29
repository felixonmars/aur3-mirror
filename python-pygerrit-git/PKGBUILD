# Contributor: Christoph Gysin <christoph.gysin@gmail.com>
_module=pygerrit
pkgname=(python-${_module}-git python2-${_module}-git)
pkgver=0.2.8.r10.gdaad8e2
pkgrel=2
pkgdesc='Client library for interacting with Gerrit'
arch=(any)
makedepends=(python-setuptools python-pbr
             python2-setuptools  python2-pbr)
url=https://github.com/sonyxperiadev/pygerrit
license=(MIT)
source=(git+https://github.com/sonyxperiadev/${_module}.git)
md5sums=(SKIP)

pkgver() {
    cd ${_module}
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cp -a ${_module}{,-python2}
}

build() {
    cd "${srcdir}"/${_module}
    python setup.py build
    cd "${srcdir}"/${_module}-python2
    python2 setup.py build
}

package_python-pygerrit-git() {
    depends=(python)
    conflicts=(python-pygerrit)
    cd ${_module}
    python setup.py install \
        --skip-build \
        --optimize=1 \
        --prefix=/usr \
        --root=${pkgdir}
}

package_python2-pygerrit-git() {
    depends=(python2)
    conflicts=(python2-pygerrit)
    cd ${_module}
    python2 setup.py install \
        --skip-build \
        --optimize=1 \
        --prefix=/usr \
        --root=${pkgdir}
}
