# Contributor: Christoph Gysin <christoph.gysin@gmail.com>
_module=pygerrit
pkgname=(python-${_module} python2-${_module})
pkgver=0.2.8
pkgrel=1
pkgdesc='Client library for interacting with Gerrit'
arch=(any)
makedepends=(python-setuptools python-pbr
             python2-setuptools  python2-pbr)
url=https://github.com/sonyxperiadev/pygerrit
license=(MIT)
source=("git+https://github.com/sonyxperiadev/${_module}.git#tag=${pkgver}")
md5sums=(SKIP)

prepare() {
    cp -a ${_module}{,-python2}
}

build() {
    cd "${srcdir}"/${_module}
    python setup.py build
    cd "${srcdir}"/${_module}-python2
    python2 setup.py build
}

package_python-pygerrit() {
    depends=(python)
    conflicts=(python-pygerrit-git)
    cd ${_module}
    python setup.py install \
        --skip-build \
        --optimize=1 \
        --prefix=/usr \
        --root=${pkgdir}
}

package_python2-pygerrit() {
    depends=(python2)
    conflicts=(python2-pygerrit-git)
    cd ${_module}
    python2 setup.py install \
        --skip-build \
        --optimize=1 \
        --prefix=/usr \
        --root=${pkgdir}
}
