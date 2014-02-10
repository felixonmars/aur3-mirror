# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=python-pgpmime-git
pkgver=v0.3.r34.gddd7ebb
pkgrel=1
pkgdesc="Tools for dealing with Pretty Good Privacy (PGP) and email."
arch=('any')
url="https://pypi.python.org/pypi/pgp-mime/"
license=('GPL3')
depends=('python' 'python-pyassuan')
makedepends=('git')
provides=('python-pgpmime')
source=("$pkgname"::'git+git://tremily.us/pgp-mime.git')
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$pkgname"
    git describe | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="${pkgdir}"
}
