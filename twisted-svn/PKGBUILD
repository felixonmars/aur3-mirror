pkgname=twisted-svn
_pkgname=twisted
pkgver=20130519.38446
pkgrel=1
pkgdesc='an event-driven networking engine (python2+3 version)'
url='http://twistedmatrix.com/'
arch=('i686' 'x86_64')
license=('MIT')
depends=('python-crypto' 'python-zope-interface')
makedepends=('subversion')
optdepends=('python-pyopenssl: for twisted.internet.ssl'
            'python-soappy: for twisted.web.soap'
            'python-pyasn1: for using conch'
            'pygtk: for using manhole'
            'tk: for using tkconch')
install=twisted.install

source=("${_pkgname}::svn+svn://svn.twistedmatrix.com/svn/Twisted/trunk")
sha1sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}" "twisted")

pkgver() {
    cd "${SRCDEST}/${_pkgname}"
    echo $(date +%F | tr -d -).$(svnversion)
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
    python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
