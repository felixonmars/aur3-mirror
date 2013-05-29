pkgname=python-oauth2-git
_pkgname=python-oauth2
pkgver=245.a83f4a2
pkgrel=1
pkgdesc='A fully tested, abstract interface to creating OAuth clients and servers (git python3 version)'
arch=('i686', 'x86_64')
url='https://github.com/simplegeo/python-oauth2'
license=('MIT')
depends=('python-httplib2')
makedepends=('git')
conflicts=('python-oauth2')
provides=('python-oauth2')
source=('git://github.com/simplegeo/python-oauth2.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$srcdir/$_pkgname"

    2to3 -wn .

    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname"

    python setup.py install --root=${pkgdir} --optimize=1

    install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/python-oauth2
}
