pkgname=python-itsdangerous-git
_pkgname=itsdangerous
pkgver=80.1803415
pkgrel=1
pkgdesc='Various helpers to pass trusted data to untrusted environments (git python3 version)'
arch=('i686', 'x86_64')
url='http://packages.python.org/itsdangerous/'
license=('custom:BSD')
depends=('python')
makedepends=('git')
conflicts=('python-itsdangerous')
provides=('python-itsdangerous')
source=('git://github.com/mitsuhiko/itsdangerous.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$srcdir/$_pkgname"

    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname"

    python setup.py install --root=${pkgdir} --optimize=1

    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/python-itsdangerous
}
