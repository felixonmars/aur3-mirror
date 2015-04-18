# Maintainer: Makito Nishimiya <nishimiya a ninja,co,jp>

_module="glance_store"
pkgname=(python-glance-store python2-glance-store)
pkgver="0.4.0"
pkgrel="5"
pkgdesc="OpenStack Glance Store Library"
arch=("any")
url="https://github.com/openstack/glance_store"
license=("Apache")
makedepends=("python-setuptools python2-setuptools" )
source=("https://pypi.python.org/packages/source/g/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('cd15e9f9a08dc8d3eeaa452682c8e53423f848eaadf064c0ee8068583aa31154')
depends=(
     "python2-ordereddict"
     "python2-jsonschema>=2.0.0"
     "python2-six>=1.4.1"
     "python2-eventlet>=0.13.0"
     "python2-cinderclient>=1.0.6"
     "python2-enum34"
     "python2-stevedore>=0.12"
     "python2-oslo-concurrency>=1.4.1"
     "python2-oslo-utils>=1.2.0"
     "python2-oslo-serialization>=1.0.0"
     "python2-oslo-i18n>=0.1.0"
     "python2-oslo-config>=1.6.0")

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-glance-store() {
    depends=("python-ordereddict"
         "python-jsonschema>=2.0.0"
         "python-six>=1.4.1"
         "python-eventlet>=0.13.0"
         "python-cinderclient>=1.0.6"
         "python-enum34"
         "python-stevedore>=0.12"
         "python-oslo-concurrency>=1.4.1"
         "python-oslo-utils>=1.2.0"
         "python-oslo-serialization>=1.0.0"
         "python-oslo-i18n>=0.1.0"
         "python-oslo-config>=1.6.0")
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-glance-store() {
    depends=("python2-ordereddict"
         "python2-jsonschema>=2.0.0"
         "python2-six>=1.4.1"
         "python2-eventlet>=0.13.0"
         "python2-cinderclient>=1.0.6"
         "python2-enum34"
         "python2-stevedore>=0.12"
         "python2-oslo-concurrency>=1.4.1"
         "python2-oslo-utils>=1.2.0"
         "python2-oslo-seriazlization>=1.0.0"
         "python2-oslo-i18n>=0.1.0"
         "python2-oslo-config>=1.6.0")
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

