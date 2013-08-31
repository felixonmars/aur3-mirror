# Maintainer:George Brooke <george+arch.aur@george-brooke.co.uk>
#Contributor: Sebastian Wiesner <lunaryorn googlemail com>
pkgname=python-flask-xml-rpc
pkgver=0.1.2
pkgrel=1
pkgdesc="This is a library that lets your Flask apps provide XML-RPC APIs."
arch=('any')
url="http://pythonhosted.org/Flask-XML-RPC/"
license=('MIT')
depends=('python-flask')
source=("https://pypi.python.org/packages/source/F/Flask-XML-RPC/Flask-XML-RPC-${pkgver}.tar.gz")
md5sums=('fc1513156e82c792fcddd23bb802e766')

prepare() {
    cd "${srcdir}/Flask-XML-RPC-${pkgver}"
    2to3 -w .
}

build() {
    cd "${srcdir}/Flask-XML-RPC-${pkgver}"
    python setup.py build
}

check() {
    cd "${srcdir}/Flask-XML-RPC-${pkgver}"
    python setup.py check
}

package() {
    cd "${srcdir}/Flask-XML-RPC-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    # fix permission stupdity
    find "${pkgdir}" -type f -exec chmod 644 {} \;
    find "${pkgdir}" -type d -exec chmod 755 {} \;
}