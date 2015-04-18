# Maintainer: Makito Nishimiya <nishimiya a ninja,co,jp>

_module="oslo.concurrency"
pkgname=(python-oslo-concurrency python2-oslo-concurrency)
pkgver="1.8.0"
pkgrel="1"
pkgdesc="oslo.concurrency libraly"
arch=("any")
url="http://git.openstack.org/cgit/openstack/oslo.concurrency"
license=("Apache")
makedepends=("python-setuptools python2-setuptools" )
source=("https://pypi.python.org/packages/source/o/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('2070e04106d9d3bdffdd9729a1f0b62a101680001534ba91aa2fdc3967509285')
depends=(
#    "python-retrying<1.3.0"
    "python-six>=1.9.0"
    "python-posix_ipc"
    "python-oslo-utils>=1.2.0"
    "python-oslo-i18n>=1.3.0"
    "python-oslo-config>=1.9.0"
    "python-fixtures>=0.3.14"
    "python-iso8601>=0.1.9"
    "python-babel>=1.3"
    "python-pbr<1.0"
    "python2-retrying<1.3.0"
    "python2-six>=1.9.0"
    #"python2-posix_ipc"
    "python2-oslo-utils>=1.2.0"
    "python2-oslo-i18n>=1.3.0"
    "python2-oslo-config>=1.9.0"
    "python2-fixtures>=0.3.14"
    "python2-iso8601>=0.1.9"
    "python2-babel>=1.3"
    "python2-pbr<1.0"
)

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-oslo-concurrency() {
    depends=(
      #  "python-retrying<1.3.0"
        "python-six>=1.9.0"
        "python-posix_ipc"
        "python-oslo-utils>=1.2.0"
        "python-oslo-i18n>=1.3.0"
        "python-oslo-config>=1.9.0"
        "python-fixtures>=0.3.14"
        "python-iso8601>=0.1.9"
        "python-babel>=1.3"
        "python-pbr<1.0"
    )
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-oslo-concurrency() {
    depends=(
        "python2-retrying<1.3.0"
        "python2-six>=1.9.0"
       #"python2-posix_ipc"
        "python2-oslo-utils>=1.2.0"
        "python2-oslo-i18n>=1.3.0"
        "python2-oslo-config>=1.9.0"
        "python2-fixtures>=0.3.14"
        "python2-iso8601>=0.1.9"
        "python2-babel>=1.3"
        "python2-pbr<1.0"
    )
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

