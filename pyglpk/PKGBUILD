# Maintainer: Thomas Nixon <tom@tomn.co.uk>
# Original contributor: Robert Schwarz <mail@rschwarz.net>
pkgname=pyglpk
pkgver=0.3.1
pkgrel=3
pkgdesc="A python2 wrapper of the GLPK library. Updated fork."
arch=("i686" "x86_64")
url="https://github.com/bradfordboyle/pyglpk"
license=('GPL')
depends=(glpk gmp python2)
makedepends=('git')
source=(git+https://github.com/bradfordboyle/pyglpk.git#commit=e51a75b6d28004e7dee6c0c6c1e0b3cc3136b700)
md5sums=(SKIP)

build() {
    cd "$srcdir/$pkgname"
    python2 setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python2 setup.py install --root "${pkgdir}"
}
