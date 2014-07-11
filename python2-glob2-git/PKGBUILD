# Maintainer: Kwrazi <kwrazi@gmail.com>
_pkgname=python2-glob2
_pyname=python-glob2

pkgname=${_pkgname}-git
pkgver=20140122
pkgrel=1
pkgdesc="An extended version of Python's builtin glob module"
arch=('any')
url="https://github.com/miracle2k/python-glob2"
license=('BSD') # BSD New
depends=('python2')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
install=
source=('git+https://github.com/miracle2k/python-glob2.git')
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pyname}
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
    cd "$srcdir/${_pyname}"
    
    python2 setup.py install --root="$pkgdir/" --optimize=1
    mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
    cp LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
