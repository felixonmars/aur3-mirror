# Maintainer: Kwrazi <kwrazi@gmail.com>
_pkgname=python-xmp-toolkit

pkgname=${_pkgname}-git
pkgver=20140309
pkgrel=1
pkgdesc="Python XMP Toolkit is a library for working with XMP metadata"
arch=('any')
url="https://pypi.python.org/pypi/python-xmp-toolkit"
license=('BSD') # BSD New
#depends=('python2')
makedepends=('python' 'git')
provides=('python-libxmp')
conflicts=()
replaces=()
backup=()
install=
source=('git+https://github.com/python-xmp-toolkit/python-xmp-toolkit.git')
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
    cd "$srcdir/${_pkgname}"
    
    python setup.py install --root="$pkgdir/" --optimize=1
    mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
    cp LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
