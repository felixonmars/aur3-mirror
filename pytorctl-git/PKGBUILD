# Maintainer: Ryon Sherman <ryon.sherman@gmail.com>

_pkgname="pytorctl"

pkgname="${_pkgname}-git"
pkgver=68bc5de
pkgrel=2
pkgdesc="TorCtl is a python Tor controller with extensions to support path building and various constraints on node and path selection, as well as statistics gathering."

provides=(${_pkgname})

arch=('any')
license=('custom')
url="http://fscked.org/projects/torctl"

depends=('python2' 'python2-geoip')
makedepends=('git')
optdepends=('python-elixir: SQL Support')

source=(
    "git+git://git.torproject.org/${_pkgname}.git"
    'setup.py'
)
md5sums=(
    'SKIP'
    'd69deeb0d0f56ec6dcef1aa2afba6e5a'
)


pkgver() {
    cd ${srcdir}/${_pkgname}
    git describe --always | sed 's|-|.|g'
}

package() {
    install -d ${pkgdir}/usr/share/{licenses,doc}/${_pkgname}
    install -Dm0644 ${srcdir}/${_pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
    install -Dm0644 ${srcdir}/${_pkgname}/README ${pkgdir}/usr/share/doc/${_pkgname}

    python2 setup.py install --root=${pkgdir} --optimize=1
}
